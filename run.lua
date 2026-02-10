#!/usr/bin/env luajit
local ffi = require 'ffi'
local assert = require 'ext.assert'
local string = require 'ext.string'
local vec2f = require 'vec-ffi.vec2f'
local vec3f = require 'vec-ffi.vec3f'
local vector = require 'stl.vector-lua'	-- I'd use pure-ffi stl.vector but it's giving me segfaults... something is collecting/leaking...
local sdl = require 'sdl'
local SDLApp = require 'sdl.app'
local wgpu = require 'wgpu'


local void_ptr = ffi.typeof'void*'
local uint64_t = ffi.typeof'uint64_t'
local char_const_ptr_1 = ffi.typeof'char const *[1]'
local WGPUInstanceDescriptor = ffi.typeof'WGPUInstanceDescriptor'
local WGPUChainedStruct_ptr = ffi.typeof'WGPUChainedStruct*'
local WGPUDawnTogglesDescriptor = ffi.typeof'WGPUDawnTogglesDescriptor'
local WGPUSurfaceSourceXlibWindow = ffi.typeof'WGPUSurfaceSourceXlibWindow'
local WGPUSurfaceDescriptor = ffi.typeof'WGPUSurfaceDescriptor'
local WGPURequestAdapterOptions = ffi.typeof'WGPURequestAdapterOptions'
local WGPURequestAdapterCallbackInfo = ffi.typeof'WGPURequestAdapterCallbackInfo'
local WGPURequestAdapterCallback = ffi.typeof'WGPURequestAdapterCallback'
local WGPUAdapterInfo = ffi.typeof'WGPUAdapterInfo'
local WGPUSupportedFeatures = ffi.typeof'WGPUSupportedFeatures'
local WGPULimits = ffi.typeof'WGPULimits'
local WGPUDeviceDescriptor = ffi.typeof'WGPUDeviceDescriptor'
local WGPUDeviceLostCallback = ffi.typeof'WGPUDeviceLostCallback'
local WGPUUncapturedErrorCallback = ffi.typeof'WGPUUncapturedErrorCallback'
local WGPURequestDeviceCallbackInfo = ffi.typeof'WGPURequestDeviceCallbackInfo'
local WGPURequestDeviceCallback = ffi.typeof'WGPURequestDeviceCallback'
local WGPUQueueWorkDoneCallbackInfo = ffi.typeof'WGPUQueueWorkDoneCallbackInfo'
local WGPUQueueWorkDoneCallback = ffi.typeof'WGPUQueueWorkDoneCallback'
local WGPUSurfaceCapabilities = ffi.typeof'WGPUSurfaceCapabilities'
local WGPUSurfaceConfiguration = ffi.typeof'WGPUSurfaceConfiguration'
local WGPUShaderSourceWGSL = ffi.typeof'WGPUShaderSourceWGSL'
local WGPUShaderModuleDescriptor = ffi.typeof'WGPUShaderModuleDescriptor'
local WGPURenderPipelineDescriptor = ffi.typeof'WGPURenderPipelineDescriptor'
local WGPUVertexAttribute = ffi.typeof'WGPUVertexAttribute'
local WGPUVertexBufferLayout = ffi.typeof'WGPUVertexBufferLayout'
local WGPUVertexBufferLayout_array = ffi.typeof'WGPUVertexBufferLayout[?]'
local WGPUFragmentState = ffi.typeof'WGPUFragmentState'
local WGPUColorTargetState = ffi.typeof'WGPUColorTargetState'
local WGPUBlendState = ffi.typeof'WGPUBlendState'
local WGPUBufferDescriptor = ffi.typeof'WGPUBufferDescriptor'
local WGPUSurfaceTexture = ffi.typeof'WGPUSurfaceTexture'
local WGPUTextureViewDescriptor = ffi.typeof'WGPUTextureViewDescriptor'
local WGPUCommandEncoderDescriptor = ffi.typeof'WGPUCommandEncoderDescriptor'
local WGPURenderPassDescriptor = ffi.typeof'WGPURenderPassDescriptor'
local WGPURenderPassColorAttachment = ffi.typeof'WGPURenderPassColorAttachment'
local WGPUCommandBufferDescriptor = ffi.typeof'WGPUCommandBufferDescriptor'
local WGPUCommandBuffer_1 = ffi.typeof'WGPUCommandBuffer[1]'

local function makeWGPUVertexBufferLayout(t)
	return WGPUVertexBufferLayout_array(#t, t)
end

local WGPUStringView = ffi.typeof'WGPUStringView'
ffi.metatype(WGPUStringView, {
	__new = function(ctype, ...)
		local o = ffi.new(ctype)
		if select('#', ...) == 1
		and type(select(1, ...)) == 'string'
		then
			local s = ...
			o.data = s
			o.length = #s
		else
			o.data, o.length = ...
		end
		return o
	end,
	__tostring = function(s)
		if s.length == 0 then return '' end
		if s.data == nil then return '(null)' end
-- getting corrupted data
-- probably because I converted the pass-as-struct-value to pointer		
		if s.length > 100000 then
			print(
				'WGPUStringView error: length='..tostring(s.length)
					..' data='..tostring(s.data)..
					'\n'
					..debug.traceback()
			)
			return ''
		end
		return ffi.string(s.data, s.length)
	end,
	__concat = string.concat,
})


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

	assert.eq(0, ffi.offsetof(WGPUDawnTogglesDescriptor, 'chain'))
	self.instance = wgpu.wgpuCreateInstance(WGPUInstanceDescriptor{
		nextInChain = ffi.cast(WGPUChainedStruct_ptr, WGPUDawnTogglesDescriptor{
			chain = {
				sType = wgpu.WGPUSType_DawnTogglesDescriptor,
			},
			enabledToggleCount = 1,
			enabledToggles = char_const_ptr_1{
				"enable_immediate_error_handling"
			},
		})
	})
print('instance', self.instance)
	assert.ne(self.instance, nil, 'wgpuCreateInstance')

	-- create surface

	do
print('SDL window', self.window)
		local props = sdl.SDL_GetWindowProperties(self.window)
print('SDL props', props)	
		local display = sdl.SDL_GetPointerProperty(props, "SDL.window.x11.display", nil)
print('X11 display', display)	
		local window = sdl.SDL_GetNumberProperty(props, "SDL.window.x11.window", 0)
print('X11 window', window)

		assert.eq(0, ffi.offsetof('WGPUSurfaceSourceXlibWindow', 'chain'))
		self.surface = wgpu.wgpuInstanceCreateSurface(self.instance, WGPUSurfaceDescriptor{
			nextInChain = ffi.cast(WGPUChainedStruct_ptr, WGPUSurfaceSourceXlibWindow{
				chain = {
					sType = wgpu.WGPUSType_SurfaceSourceXlibWindow,
				},
				display = ffi.cast(void_ptr, display),
				window = ffi.cast(uint64_t, window),
			}),
			label = {length=0xFFFFFFFFFFFFFFFFULL},--SIZE_MAX}, should be in c.stdint
		})
print('surface', self.surface)
	end

	-- create adapter

	do
		local function callback(
			status,		-- WGPURequestAdapterStatus 
			adapter,	-- WGPUAdapter 
			message,	-- WGPUStringView *
			userdata1,	-- void * 
			userdata2	-- void *
		)
			local properties = WGPUAdapterInfo()
			wgpu.wgpuAdapterGetInfo(adapter, properties)
			print"Adapter properties:"
			print(" - vendorID: " .. properties.vendorID)
			if properties.vendor.length > 0 then
				print(" - vendorName: " .. properties.vendor)
			end
			if properties.architecture.length > 0 then
				print(" - architecture: " .. properties.architecture)
			end
			print(" - deviceID: " .. properties.deviceID)
			if properties.device.length > 0 then
				print(" - device: " .. properties.device)
			end
			if properties.description.length > 0 then
				print(" - description: " .. properties.description)
			end
			print(" - backendType: 0x" .. ('%x'):format(tonumber(properties.backendType)))
			print(" - adapterType: 0x" .. ('%x'):format(tonumber(properties.adapterType)))

			local features = WGPUSupportedFeatures()
			wgpu.wgpuAdapterGetFeatures(adapter, features)
			io.write("Adapter features:")
			for i=0,tonumber(features.featureCount)-1 do
				io.write((" 0x%08x"):format(tonumber(features.features[i])))
			end
			print()

			local limits = WGPULimits()
			if wgpu.WGPUStatus_Success == wgpu.wgpuAdapterGetLimits(adapter, limits) then
				print"Adapter limits:"
				for _,field in ipairs{
					'maxTextureDimension1D',
					'maxTextureDimension2D',
					'maxTextureDimension3D',
					'maxTextureArrayLayers',
					'maxBindGroups',
					'maxBindGroupsPlusVertexBuffers',
					'maxBindingsPerBindGroup',
					'maxDynamicUniformBuffersPerPipelineLayout',
					'maxDynamicStorageBuffersPerPipelineLayout',
					'maxSampledTexturesPerShaderStage',
					'maxSamplersPerShaderStage',
					'maxStorageBuffersPerShaderStage',
					'maxStorageTexturesPerShaderStage',
					'maxUniformBuffersPerShaderStage',
					'maxUniformBufferBindingSize',
					'maxStorageBufferBindingSize',
					'minUniformBufferOffsetAlignment',
					'minStorageBufferOffsetAlignment',
					'maxVertexBuffers',
					'maxBufferSize',
					'maxVertexAttributes',
					'maxVertexBufferArrayStride',
					'maxInterStageShaderVariables',
					'maxColorAttachments',
					'maxColorAttachmentBytesPerSample',
					'maxComputeWorkgroupStorageSize',
					'maxComputeInvocationsPerWorkgroup',
					'maxComputeWorkgroupSizeX',
					'maxComputeWorkgroupSizeY',
					'maxComputeWorkgroupSizeZ',
					'maxComputeWorkgroupsPerDimension',
					'maxImmediateSize',
				} do
					print(' '..field..' = '..tostring(limits[field]))
				end
			end

			if status == wgpu.WGPURequestAdapterStatus_Success then
				self.adapter = adapter
			else
				print("Could not get WebGPU adapter: " .. message)
			end
		end
		self.retainCallback = callback
		local closure = ffi.cast(WGPURequestAdapterCallback, callback)	-- can't convert
		wgpu.wgpuInstanceRequestAdapter(
			self.instance,
			WGPURequestAdapterOptions{
				compatibleSurface = self.surface,
			},
			WGPURequestAdapterCallbackInfo{
				mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
				callback = closure,
			}
		)		
		assert(self.adapter, 'wgpuInstanceRequestAdapter: failed to find adapter')
print('adapter', self.adapter)
		self.retainCallback = nil
		closure:free()
	end

	-- create device
	
	do
		self.deviceLostCallback = function(
			device, 	-- WGPUDevice const *
			reason, 	-- WGPUDeviceLostReason ,
			message,	-- WGPUStringView *
			userdata1,	-- void* 
			userdata2	-- void* 
		)
			print("Device lost, reason:"..tostring(reason)
				..(message.length > 0 and ' message:'..message or '')
			)
		end
		self.deviceLostClosure = ffi.cast(WGPUDeviceLostCallback, self.deviceLostCallback)
		
		self.uncapturedErrorCallback = function(
			device,		-- WGPUDevice const *
			errorType,	-- WGPUErrorType
			message,	-- WGPUStringView *
			userdata1,	-- void* 
			userdata2	-- void* 
		)
			print("Uncaptured device error, type="..tostring(errorType)
				..(message.length > 0 and ' message:'..message or '')
			)
		end
		self.uncapturedErrorClosure = ffi.cast(WGPUUncapturedErrorCallback, self.uncapturedErrorCallback)

		self.requestDeviceCallback = function(
			status,		-- WGPURequestDeviceStatus
			device,		-- WGPUDevice
			message,	-- WGPUStringView *
			userdata1,	-- void *
			userdata2	-- void *
		)
			do--inspectDevice(device);
				local features = WGPUSupportedFeatures()
				wgpu.wgpuDeviceGetFeatures(device, features)
				io.write("Device features:")
				for i=0,tonumber(features.featureCount)-1 do
					io.write((" 0x%08x"):format(tonumber(features.features[i])))
				end
				print()

				local limits = WGPULimits()
				if wgpu.WGPUStatus_Success == wgpu.wgpuDeviceGetLimits(device, limits) then
					print"Device limits:"
					for _,field in ipairs{
						'maxTextureDimension1D',
						'maxTextureDimension2D',
						'maxTextureDimension3D',
						'maxTextureArrayLayers',
						'maxBindGroups',
						'maxBindGroupsPlusVertexBuffers',
						'maxBindingsPerBindGroup',
						'maxDynamicUniformBuffersPerPipelineLayout',
						'maxDynamicStorageBuffersPerPipelineLayout',
						'maxSampledTexturesPerShaderStage',
						'maxSamplersPerShaderStage',
						'maxStorageBuffersPerShaderStage',
						'maxStorageTexturesPerShaderStage',
						'maxUniformBuffersPerShaderStage',
						'maxUniformBufferBindingSize',
						'maxStorageBufferBindingSize',
						'minUniformBufferOffsetAlignment',
						'minStorageBufferOffsetAlignment',
						'maxVertexBuffers',
						'maxBufferSize',
						'maxVertexAttributes',
						'maxVertexBufferArrayStride',
						'maxInterStageShaderVariables',
						'maxColorAttachments',
						'maxColorAttachmentBytesPerSample',
						'maxComputeWorkgroupStorageSize',
						'maxComputeInvocationsPerWorkgroup',
						'maxComputeWorkgroupSizeX',
						'maxComputeWorkgroupSizeY',
						'maxComputeWorkgroupSizeZ',
						'maxComputeWorkgroupsPerDimension',
						'maxImmediateSize',
					} do
						print(' '..field..' = '..tostring(limits[field]))
					end
				end
			end
			
			if status == wgpu.WGPURequestDeviceStatus_Success then
				self.device = device
			else
				print("Could not get WebGPU device: " .. message)
			end
		end
		local requestDeviceClosure = ffi.cast(WGPURequestDeviceCallback, self.requestDeviceCallback)

		wgpu.wgpuAdapterRequestDevice(
			self.adapter,
			WGPUDeviceDescriptor{
				label = WGPUStringView"My Device",
--[[
				.requiredLimits = (WGPULimits[]){{
					//.maxBufferSize = self.vertexCount,
					.maxVertexBuffers = 2,
					.maxVertexAttributes = 2,
					.maxVertexBufferArrayStride = sizeof(Tensor::float3),
				}},
--]]
				defaultQueue = {
					label = WGPUStringView"The default queue",
				},
				deviceLostCallbackInfo = {
					mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
					callback = self.deviceLostClosure,
				},
				uncapturedErrorCallbackInfo = {
					callback = self.uncapturedErrorClosure,
				},
			},
			WGPURequestDeviceCallbackInfo{
				mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
				callback = requestDeviceClosure,
			}
		)
print("device", self.device)
		self.requestDeviceCallback = nil
		requestDeviceClosure:free()
	end

	-- create queue

	self.queueWorkDoneCallback = function(
		status,		-- WGPUQueueWorkDoneStatus 
		message,	-- WGPUStringView* 
		userdata1,	-- void* 
		userdata2	-- void* 
	)
		print("Queued work finished with status: " .. tostring(status)
				..(message.length > 0 and ' message:'..message or '')
		)
	end
	self.queueWorkDoneClosure = ffi.cast(WGPUQueueWorkDoneCallback, self.queueWorkDoneCallback)
	self.queue = wgpu.wgpuDeviceGetQueue(self.device)
	wgpu.wgpuQueueOnSubmittedWorkDone(
		self.queue,
		WGPUQueueWorkDoneCallbackInfo{
			mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
			callback = self.queueWorkDoneClosure,
		}
	)

	do
		local capabilities = WGPUSurfaceCapabilities()
		wgpu.wgpuSurfaceGetCapabilities(self.surface, self.adapter, capabilities)
		self.surfaceFormat = capabilities.formats[0]
	end
print('surfaceFormat', self.surfaceFormat)	

	self:recreateSwapChain()

	-- create shaders

	local code = [[
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
]]
	local vsFunc = "vs_main"
	local fsFunc = "fs_main"
	assert.eq(0, ffi.offsetof(WGPUShaderSourceWGSL, 'chain'));
	local shaderModule = wgpu.wgpuDeviceCreateShaderModule(
		self.device, 
		WGPUShaderModuleDescriptor{
			nextInChain = ffi.cast(WGPUChainedStruct_ptr, WGPUShaderSourceWGSL{
				chain = {
					sType = wgpu.WGPUSType_ShaderSourceWGSL,
				},
				code = {
					data = code,
					length = #code,
				},
			}),
		}
	)

	self.pipeline = wgpu.wgpuDeviceCreateRenderPipeline(self.device, WGPURenderPipelineDescriptor{
		vertex = {
			module = shaderModule,
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
			module = shaderModule,
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
	})
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
		local bufferSize = vertexCPU:getNumBytes()
		self.vertexGPU = wgpu.wgpuDeviceCreateBuffer(
			self.device, 
			WGPUBufferDescriptor{
				usage = bit.bor(
					wgpu.WGPUBufferUsage_CopyDst,
					wgpu.WGPUBufferUsage_Vertex
				),
				size = bufferSize,
			}
		)
		wgpu.wgpuQueueWriteBuffer(
			self.queue,
			self.vertexGPU, 
			0, 
			vertexCPU.v,
			bufferSize
		)
	end
print('vertexGPU', self.vertexGPU)
	
	do
		local colorCPU = vector(vec3f, self.vertexCount)
		for i=0,self.vertexCount-1 do
			colorCPU.v[i] = vec3f(math.random(), math.random(), math.random())
		end
		local bufferSize = colorCPU:getNumBytes()
		self.colorGPU = wgpu.wgpuDeviceCreateBuffer(
			self.device,
			WGPUBufferDescriptor{
				usage = bit.bor(
					wgpu.WGPUBufferUsage_CopyDst,
					wgpu.WGPUBufferUsage_Vertex
				),
				size = bufferSize,
			}
		)
		wgpu.wgpuQueueWriteBuffer(
			self.queue,
			self.colorGPU, 
			0, 
			colorCPU.v,
			bufferSize
		)
	end
print('colorGPU', self.colorGPU)

	print'initWebGPU done'
end

function WebGPUApp:recreateSwapChain()
	wgpu.wgpuSurfaceConfigure(
		self.surface,
		WGPUSurfaceConfiguration{
			device = self.device,
			format = self.surfaceFormat,
			usage = wgpu.WGPUTextureUsage_RenderAttachment,
			width = self.width,
			height = self.height,
			alphaMode = wgpu.WGPUCompositeAlphaMode_Auto,
			presentMode = wgpu.WGPUPresentMode_Fifo,
		}
	)
print('wgpuSurfaceConfigure', self.surface)
end

function WebGPUApp:update()
	-- handle update
--print'update begin'
	-- get next surface target view

	local surfaceTexture = WGPUSurfaceTexture()
	wgpu.wgpuSurfaceGetCurrentTexture(self.surface, surfaceTexture)
	if surfaceTexture.status ~= wgpu.WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal 
	and surfaceTexture.status ~= wgpu.WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal
	then
print("wgpuSurfaceGetCurrentTexture failed with status " .. tostirng(surfaceTexture.status))
		return
	end

	local targetView = wgpu.wgpuTextureCreateView(
		surfaceTexture.texture,
		WGPUTextureViewDescriptor{
			label = WGPUStringView"surface textureView",
			format = wgpu.wgpuTextureGetFormat(surfaceTexture.texture),
			dimension = wgpu.WGPUTextureViewDimension_2D,
			mipLevelCount = 1,
			arrayLayerCount = 1,
			aspect = wgpu.WGPUTextureAspect_All,
		}
	)
	if not targetView then
print("wgpuTextureCreateView failed")
		return
	end

	-- draw on it

	local encoder = wgpu.wgpuDeviceCreateCommandEncoder(
		self.device, 
		WGPUCommandEncoderDescriptor{
			label = WGPUStringView"encoder",
		}
	)

	local renderPass = wgpu.wgpuCommandEncoderBeginRenderPass(
		encoder, 
		WGPURenderPassDescriptor{
			label = WGPUStringView"renderPass",
			colorAttachmentCount = 1,
			colorAttachments = WGPURenderPassColorAttachment{
				view = targetView,
				depthSlice = wgpu.WGPU_DEPTH_SLICE_UNDEFINED,	-- nonzero... smh...
				loadOp = wgpu.WGPULoadOp_Clear,
				storeOp = wgpu.WGPUStoreOp_Store,
				clearValue = {.005, .01, .02, 1},
			},
		}
	)
	wgpu.wgpuRenderPassEncoderSetPipeline(
		renderPass,
		self.pipeline
	)
	wgpu.wgpuRenderPassEncoderSetVertexBuffer(
		renderPass,
		0,
		self.vertexGPU,
		0,
		wgpu.wgpuBufferGetSize(self.vertexGPU)
	)
	wgpu.wgpuRenderPassEncoderSetVertexBuffer(
		renderPass,
		1,
		self.colorGPU,
		0,
		wgpu.wgpuBufferGetSize(self.colorGPU)
	)
	wgpu.wgpuRenderPassEncoderDraw(
		renderPass,
		self.vertexCount,
		1,
		0,
		0
	)
	wgpu.wgpuRenderPassEncoderEnd(renderPass)
	wgpu.wgpuRenderPassEncoderRelease(renderPass)

	local command = WGPUCommandBuffer_1()
	command[0] = wgpu.wgpuCommandEncoderFinish(
		encoder,
		WGPUCommandBufferDescriptor{
			label = WGPUStringView"command buffer",
		}
	)
	wgpu.wgpuCommandEncoderRelease(encoder)
	wgpu.wgpuQueueSubmit(self.queue, 1, command)
	wgpu.wgpuCommandBufferRelease(command[0])

	wgpu.wgpuTextureViewRelease(targetView)
	wgpu.wgpuSurfacePresent(self.surface)

	wgpu.wgpuDeviceTick(self.device)
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
	wgpu.wgpuBufferRelease(self.colorGPU)
	wgpu.wgpuBufferRelease(self.vertexGPU)
	wgpu.wgpuRenderPipelineRelease(self.pipeline)
	wgpu.wgpuSurfaceUnconfigure(self.surface)	-- does it matter?
	wgpu.wgpuQueueRelease(self.queue)
	wgpu.wgpuSurfaceRelease(self.surface)
	wgpu.wgpuDeviceRelease(self.device)
	wgpu.wgpuAdapterRelease(self.adapter)
	wgpu.wgpuInstanceRelease(self.instance)
os.exit()
print'exit end'
	WebGPUApp.super.exit(self)
end

return WebGPUApp():run()
