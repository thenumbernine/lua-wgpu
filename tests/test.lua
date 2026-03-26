#!/usr/bin/env luajit
local ffi = require 'ffi'
local assert = require 'ext.assert'
local getTime = require 'ext.timer'.getTime
local vec2f = require 'vec-ffi.vec2f'
local vec3f = require 'vec-ffi.vec3f'
local vector = require 'stl.vector-lua'	-- I'd use pure-ffi stl.vector but it's giving me segfaults... something is collecting/leaking...
local sdl = require 'sdl'
local SDLApp = require 'sdl.app'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'
local WGPUInstance = require 'wgpu.instance'
local WGPUShaderWGSL = require 'wgpu.shaderwgsl'
local WGPUPipeline = require 'wgpu.pipeline'
local WGPUBuffer = require 'wgpu.buffer'
local WGPUBindGroup = require 'wgpu.bindgroup'
local WGPUBindGroupLayout = require 'wgpu.bindgrouplayout'

local WGPUVertexAttribute = ffi.typeof'WGPUVertexAttribute'
local WGPUVertexBufferLayout_array = ffi.typeof'WGPUVertexBufferLayout[?]'
local WGPUFragmentState = ffi.typeof'WGPUFragmentState'
local WGPUColorTargetState = ffi.typeof'WGPUColorTargetState'
local WGPUBlendState = ffi.typeof'WGPUBlendState'
local WGPURenderPassColorAttachment = ffi.typeof'WGPURenderPassColorAttachment'

local function makeWGPUVertexBufferLayout(t)
	return WGPUVertexBufferLayout_array(#t, t)
end


local WebGPUApp = SDLApp:subclass()
WebGPUApp.title = 'WebGPU App'

function WebGPUApp:initWindow()
	WebGPUApp.super.initWindow(self)
	self:initWebGPU()
end

-- override for post-webgpu-init stuff
function WebGPUApp:initWebGPU()
	self.instance = WGPUInstance()
print('instance', self.instance)

	self.surface = self.instance:makeSurface{
		sdlWindow = self.window,
	}
print('surface', self.surface)

	self.adapter = self.surface:findAdapter()
print('adapter', self.adapter)

	self.device = self.adapter:findDevice{
		label = 'my device',
--[[
		requiredLimits = (WGPULimits[]){{
			//.maxBufferSize = self.vertexCount,
			.maxVertexBuffers = 2,
			.maxVertexAttributes = 2,
			.maxVertexBufferArrayStride = sizeof(Tensor::float3),
		}},
--]]
		defaultQueue = {
			label = 'my queue',
		},
		deviceLostCallbackInfo = {
			mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
			callback = function(
				device, 	-- WGPUDevice const *
				reason, 	-- WGPUDeviceLostReason ,
				message,	-- string
				userdata1,	-- void*
				userdata2	-- void*
			)
				print('device lost'..(reason and ' reason:'..reason or ''))
			end,
		},
		uncapturedErrorCallbackInfo = {
			callback = function(
				device,		-- WGPUDevice const *
				errorType,	-- WGPUErrorType
				message,	-- string
				userdata1,	-- void*
				userdata2	-- void*
			)
				print('uncaptured device error, type='..tostring(errorType)
					..(message and ' message:'..message or '')
				)
			end,
		},
	}
print("device", self.device)

	self.queue = self.device:getQueue{
		workDoneCallback = function(
			status,		-- WGPUQueueWorkDoneStatus
			message,	-- string
			userdata1,	-- void*
			userdata2	-- void*
		)
			print("queued work finished with status: " .. tostring(status)
				..(message and ' message:'..message or '')
			)
		end,
	}

	self.surfaceFormat = self.adapter:getCapabilities().formats[0]
print('surfaceFormat', self.surfaceFormat)

	self:recreateSwapChain()

	local shaderModule = WGPUShaderWGSL{
		device = self.device.id,
		code = [[
struct VertexOutput {
	@builtin(position) pos : vec4f,
	@location(0) color : vec3f
};

const M_PI = 3.14159265358979323846f;

fn perspective(
	fovy : f32,
	aspectRatio : f32,
	zNear : f32,
	zFar : f32
) -> mat4x4f {
	let radians = fovy * M_PI / 360.;
	let deltaZ = zFar - zNear;
	let sine = sin(radians);
	let cotangent = cos(radians) / sine;
	return mat4x4f(
		cotangent / aspectRatio, 0, 0, 0,
		0, cotangent, 0, 0,
		0, 0, -(zFar + zNear) / deltaZ, -1,
		0, 0, -2 * zNear * zFar / deltaZ, 1,
	);
}

fn xform(x : f32, y : f32, z : f32) -> mat4x4f {
	return mat4x4f(
		1., 0., 0., 0.,
		0., 1., 0., 0.,
		0., 0., 1., 0.,
		x, y, z, 1.
	);
}

fn roty(t : f32) -> mat4x4f {
	let c = cos(t);
	let s = sin(t);
	return mat4x4f(
		c, 0., s, 0.,
		0., 1., 0., 0.,
		-s, 0., c, 0.,
		0., 0., 0., 1.
	);
}

struct Uniforms {
	t : f32,
	aspectRatio : f32,
};
@group(0) @binding(0) var<uniform> uniforms: Uniforms;

@vertex
fn vs_main(
	@builtin(vertex_index) vertexIndex: u32,
	@location(0) vertex : vec3f,
	@location(1) color : vec3f
) -> VertexOutput {
	var out : VertexOutput;
	out.pos = 
		perspective(90., uniforms.aspectRatio, .01, 100.)
		* xform(0., 0., -5.)
		* roty(uniforms.t) 
		* vec4f(vertex * 2. - 1., 1.);
	out.color = color;
	return out;
}

@fragment
fn fs_main(
	in : VertexOutput
) ->
	@location(0) vec4f
{
	return vec4f(in.color, 1.);
}
]],
	}
	local vsFunc = "vs_main"
	local fsFunc = "fs_main"

	-- so much shit ... just to bind a buffer ...
	
	local Uniforms = ffi.typeof[[struct {
	float t;
	float aspectRatio;
}]]
	self.uniformsCPU = vector(Uniforms, 1)
	self.uniformsCPU.v[0].t = getTime()
	self.uniformsCPU.v[0].aspectRatio = self.width / self.height
	self.uniformsGPU = WGPUBuffer{
		device = self.device.id,
		usage = bit.bor(
			wgpu.WGPUBufferUsage_CopyDst,
			wgpu.WGPUBufferUsage_Uniform
		),
		size = self.uniformsCPU:getNumBytes(),
	}
	self.queue:writeBuffer(
		self.uniformsGPU.id,
		0,
		self.uniformsCPU.v,
		#self.uniformsGPU
	)

	self.bindGroupLayout = WGPUBindGroupLayout{
		device = self.device.id,
		entryCount = 1,
		entries = ffi.typeof'WGPUBindGroupLayoutEntry[1]'{{
			binding = 0,
			visibility = bit.bor(
				wgpu.WGPUShaderStage_Vertex,
				wgpu.WGPUShaderStage_Fragment
			),
			buffer = {
				type = wgpu.WGPUBufferBindingType_Uniform,
				minBindingSize = self.uniformsCPU:getNumBytes(),
			}
		}},
	}

	self.pipeline = WGPUPipeline{
		device = self.device.id,
		layout = wgpu.wgpuDeviceCreatePipelineLayout(	-- WGPUPipelineLayout
			self.device.id,
			ffi.typeof'WGPUPipelineLayoutDescriptor[1]'{{
				bindGroupLayoutCount = 1,
				bindGroupLayouts = ffi.typeof'WGPUBindGroupLayout[1]'{
					self.bindGroupLayout.id,
				},
			}}
		),
		vertex = {
			module = shaderModule.id,
			entryPoint = WGPUStringView(vsFunc),
			bufferCount = 2,
			buffers = makeWGPUVertexBufferLayout{
				{	-- vertex
					stepMode = wgpu.WGPUVertexStepMode_Vertex,
					arrayStride = ffi.sizeof(vec3f),
					attributeCount = 1,
					attributes = WGPUVertexAttribute{
						format = wgpu.WGPUVertexFormat_Float32x3,
						shaderLocation = 0,
					},
				},
				{	-- color
					stepMode = wgpu.WGPUVertexStepMode_Vertex,
					arrayStride = ffi.sizeof(vec3f),
					attributeCount = 1,
					attributes = WGPUVertexAttribute{
						format = wgpu.WGPUVertexFormat_Float32x3,
						shaderLocation = 1,
					},
				},
			},
		},
		primitive = {
			topology = wgpu.WGPUPrimitiveTopology_TriangleList,
			stripIndexFormat = wgpu.WGPUIndexFormat_Undefined,
			frontFace = wgpu.WGPUFrontFace_CCW,
			cullMode = wgpu.WGPUCullMode_None,
		},
		multisample = {
			count = 1,
			mask = ffi.cast('uint32_t', -1),	-- fun fact, this works for uint32 and uint64 but not uint16 or uint8 -- and that's by C specification.
		},
		fragment = WGPUFragmentState{
			module = shaderModule.id,
			entryPoint = WGPUStringView(fsFunc),
			targetCount = 1,
			targets = WGPUColorTargetState{
				format = self.surfaceFormat,
				blend = WGPUBlendState{
					color = {
						operation = wgpu.WGPUBlendOperation_Add,
						srcFactor = wgpu.WGPUBlendFactor_SrcAlpha,
						dstFactor = wgpu.WGPUBlendFactor_OneMinusSrcAlpha,
					},
					alpha = {
						operation = wgpu.WGPUBlendOperation_Add,
						srcFactor = wgpu.WGPUBlendFactor_Zero,
						dstFactor = wgpu.WGPUBlendFactor_One,
					},
				},
				writeMask = wgpu.WGPUColorWriteMask_All,
			},
		},
	}
print('pipeline', self.pipeline)

	self.vertexCount = 3 * 1000
print('vertexCount', self.vertexCount)

	self.vertexCPU = vector(vec3f, self.vertexCount)
	for i=0,self.vertexCount-1 do
		self.vertexCPU.v[i] = vec3f(math.random(), math.random(), math.random()) * 2 - 1
	end

	-- buffers
	self.vertexGPU = WGPUBuffer{
		device = self.device.id,
		usage = bit.bor(
			wgpu.WGPUBufferUsage_CopyDst,
			wgpu.WGPUBufferUsage_Vertex
		),
		size = self.vertexCPU:getNumBytes(),
	}
	self.queue:writeBuffer(
		self.vertexGPU.id,
		0,
		self.vertexCPU.v,
		#self.vertexGPU
	)
print('vertexGPU', self.vertexGPU)

	self.colorCPU = vector(vec3f, self.vertexCount)
	for i=0,self.vertexCount-1 do
		self.colorCPU.v[i] = vec3f(math.random(), math.random(), math.random())
	end
	self.colorGPU = WGPUBuffer{
		device = self.device.id,
		usage = bit.bor(
			wgpu.WGPUBufferUsage_CopyDst,
			wgpu.WGPUBufferUsage_Vertex
		),
		size = self.colorCPU:getNumBytes()
	}
	self.queue:writeBuffer(
		self.colorGPU.id,
		0,
		self.colorCPU.v,
		#self.colorGPU
	)
print('colorGPU', self.colorGPU)

	self.bindGroup = WGPUBindGroup{
		device = self.device.id,
		layout = self.bindGroupLayout.id,
		entryCount = 1,
		entries = ffi.typeof'WGPUBindGroupEntry[1]'{{
			binding = 0,
			buffer = self.uniformsGPU.id,
			size = #self.uniformsGPU,
		}},
	}

	print'initWebGPU done'
end

function WebGPUApp:recreateSwapChain()
	self.surface:configure{
		device = self.device.id,
		format = self.surfaceFormat,
		usage = wgpu.WGPUTextureUsage_RenderAttachment,
		width = self.width,
		height = self.height,
		alphaMode = wgpu.WGPUCompositeAlphaMode_Auto,
		presentMode = wgpu.WGPUPresentMode_Fifo,
	}
print('wgpuSurfaceConfigure', self.surface)
end

function WebGPUApp:update()
	-- handle update
--print'update begin'
	-- get next surface target view

	-- idk what to do.
	-- here's a Lorentz attractor run on the colors and vertexes of the triangles.
	do
		local t = getTime()
		local dt = .001
		local sigma = 10
		local rho = 28
		local beta = 8/3
		for i=0,self.vertexCount-1,3 do
			local v = self.vertexCPU.v + i
			v.x = (v.x - .5) * 60
			v.y = (v.y - .5) * 60
			v.z = v.z * 60
			v.x = v.x + dt * sigma * (v.y - v.x)
			v.y = v.y + dt * (v.x * (rho - v.z) - v.y)
			v.z = v.z + dt * (v.x * v.y - beta * v.z)
			v.x = v.x / 60 + .5
			v.y = v.y / 60 + .5
			v.z = v.z / 60
		
			v[1].x = v.x + .1 * math.sin(t * 3.1)
			v[1].y = v.y + .1 * math.sin(t * 3.2)
			v[1].z = v.z + .1 * math.sin(t * 3.3)
			v[2].x = v.x + .1 * math.sin(t * 3.4)
			v[2].y = v.y + .1 * math.sin(t * 3.5)
			v[2].z = v.z + .1 * math.sin(t * 3.6)
		for i=0,self.vertexCount-1 do
		end	
			local c = self.colorCPU.v + i
			c.x = (c.x - .5) * 60
			c.y = (c.y - .5) * 60
			c.z = c.z * 60
			c.x = c.x + dt * sigma * (c.y - c.x)
			c.y = c.y + dt * (c.x * (rho - c.z) - c.y)
			c.z = c.z + dt * (c.x * c.y - beta * c.z)
			c.x = c.x / 60 + .5
			c.y = c.y / 60 + .5
			c.z = c.z / 60
		end
		self.uniformsCPU.v[0].t = t
		self.uniformsCPU.v[0].aspectRatio = self.width / self.height
		self.queue:writeBuffer(
			self.vertexGPU.id,
			0,
			self.vertexCPU.v,
			#self.vertexGPU
		)
		self.queue:writeBuffer(
			self.colorGPU.id,
			0,
			self.colorCPU.v,
			#self.colorGPU
		)
		self.queue:writeBuffer(
			self.uniformsGPU.id,
			0,
			self.uniformsCPU.v,
			#self.uniformsGPU
		)
	end


	local surfaceTexture, msg = self.surface:getCurrentTexture()
	if not surfaceTexture then
		print(msg)
		return
	end

	local targetView = surfaceTexture:makeView{
		texture = surfaceTexture.id.texture,
		label = WGPUStringView"surface textureView",
		format = wgpu.wgpuTextureGetFormat(surfaceTexture.id.texture),
		dimension = wgpu.WGPUTextureViewDimension_2D,
		mipLevelCount = 1,
		arrayLayerCount = 1,
		aspect = wgpu.WGPUTextureAspect_All,
	}
	if not targetView then
print("wgpuTextureCreateView failed")
		return
	end

	-- draw on it

	local encoder = self.device:makeEncoder{
		label = 'encoder',
	}

	encoder:beginRenderPass{
		label = 'renderPass',
		colorAttachmentCount = 1,
		colorAttachments = WGPURenderPassColorAttachment{
			view = targetView.id,
			depthSlice = wgpu.WGPU_DEPTH_SLICE_UNDEFINED,	-- nonzero... smh...
			loadOp = wgpu.WGPULoadOp_Clear,
			storeOp = wgpu.WGPUStoreOp_Store,
			clearValue = {.005, .01, .02, 1},
		},
	}
		:setPipeline(self.pipeline)
		:setVertexBuffers(self.vertexGPU, self.colorGPU)
		:setBindGroup(
			0, -- groupIndex
			self.bindGroup.id,	-- group
			0,	-- dynamicOffsetCount
			nil		-- dynamicOffsets
		)
		:draw(self.vertexCount, 1, 0, 0)
		:done()
		:destroy()

	local cmdbuf = encoder:finish()
	encoder:destroy()
	self.queue:submit(cmdbuf)
	cmdbuf:destroy()
	targetView:destroy()
	self.surface:present()
	self.device:tick()
--print'update end'
end

function WebGPUApp:resize()
print'resizing'
	WebGPUApp.super.resize(self)
	-- handle resize
	self:recreateSwapChain()
end

function WebGPUApp:exit()
print'exit begin'
	-- shutdown here
	self.colorGPU:destroy()
	self.vertexGPU:destroy()
	self.pipeline:destroy()
	self.queue:destroy()
	self.surface:destroy()

	-- before releasing the device, I have to unregister the callbacks or they will get corrupted WGPUStringView messages
	-- oh wait, you can't do that?
	-- I guess I'll just let them know to stop reporting anything
	self.device:destroy()

	self.adapter:destroy()
	self.instance:destroy()
print'exit end'
	WebGPUApp.super.exit(self)
end

return WebGPUApp():run()
