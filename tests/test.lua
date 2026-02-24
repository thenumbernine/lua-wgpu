#!/usr/bin/env luajit
local ffi = require 'ffi'
local assert = require 'ext.assert'
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
	-- weebgpu init here

	-- create instance

	self.instance = WGPUInstance()
print('instance', self.instance)

	-- create surface

	self.surface = self.instance:makeSurface{
		sdlWindow = self.window,
	}
print('surface', self.surface)

	-- create adapter

	self.adapter = self.surface:findAdapter()
print('adapter', self.adapter)

	-- create device

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
				print('Device lost'..(reason and ' reason:'..reason or ''))
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
				print('Uncaptured device error, type='..tostring(errorType)
					..(message and ' message:'..message or '')
				)
			end,
		},
	}
print("device", self.device)

	-- create queue

	self.queue = self.device:getQueue{
		workDoneCallback = function(
			status,		-- WGPUQueueWorkDoneStatus
			message,	-- string
			userdata1,	-- void*
			userdata2	-- void*
		)
			print("Queued work finished with status: " .. tostring(status)
				..(message and ' message:'..message or '')
			)
		end,
	}

	self.surfaceFormat = self.adapter:getCapabilities().formats[0]
print('surfaceFormat', self.surfaceFormat)

	self:recreateSwapChain()

	-- create shaders

	local shaderModule = WGPUShaderWGSL{
		device = self.device.id,
		code = [[
struct VertexOutput {
	@builtin(position) pos : vec4f,
	@location(0) color : vec3f
};

@vertex
fn vs_main(
	@builtin(vertex_index) vertexIndex: u32,
	@location(0) vertex : vec2f,
	@location(1) color : vec3f
) -> VertexOutput {
	var out : VertexOutput;
	out.pos = vec4f(vertex, 0., 1.);
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

	self.pipeline = WGPUPipeline{
		device = self.device.id,
		vertex = {
			module = shaderModule.id,
			entryPoint = WGPUStringView(vsFunc),
			bufferCount = 2,
			buffers = makeWGPUVertexBufferLayout{
				{	-- vertex
					stepMode = wgpu.WGPUVertexStepMode_Vertex,
					arrayStride = ffi.sizeof(vec2f),
					attributeCount = 1,
					attributes = WGPUVertexAttribute{
						format = wgpu.WGPUVertexFormat_Float32x2,
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

	local vertexCPU = vector(vec2f, {
		{-.5, -.5},
		{.5, -.5},
		{0., .5},
		{-.55, -.5},
		{-.05, .5},
		{-.55, .5},
	})
	self.vertexCount = #vertexCPU
print('vertexCount', self.vertexCount)

	-- buffers
	do
		self.vertexGPU = WGPUBuffer{
			device = self.device.id,
			usage = bit.bor(
				wgpu.WGPUBufferUsage_CopyDst,
				wgpu.WGPUBufferUsage_Vertex
			),
			size = vertexCPU:getNumBytes(),
		}
		wgpu.wgpuQueueWriteBuffer(
			self.queue.id,
			self.vertexGPU.id,
			0,
			vertexCPU.v,
			#self.vertexGPU
		)
	end
print('vertexGPU', self.vertexGPU)

	do
		local colorCPU = vector(vec3f, self.vertexCount)
		for i=0,self.vertexCount-1 do
			colorCPU.v[i] = vec3f(math.random(), math.random(), math.random())
		end
		self.colorGPU = WGPUBuffer{
			device = self.device.id,
			usage = bit.bor(
				wgpu.WGPUBufferUsage_CopyDst,
				wgpu.WGPUBufferUsage_Vertex
			),
			size = colorCPU:getNumBytes()
		}
		wgpu.wgpuQueueWriteBuffer(
			self.queue.id,
			self.colorGPU.id,
			0,
			colorCPU.v,
			#self.colorGPU
		)
	end
print('colorGPU', self.colorGPU)

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
		:setVertexBuffer(
			0,
			self.vertexGPU.id,
			0,
			#self.vertexGPU
		)
		:setVertexBuffer(
			1,
			self.colorGPU.id,
			0,
			#self.colorGPU
		)
		:draw(
			self.vertexCount,
			1,
			0,
			0
		)
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
