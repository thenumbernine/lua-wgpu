#!/usr/bin/env luajit
local ffi = require 'ffi'
local assert = require 'ext.assert'
local string = require 'ext.string'
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


local WGPUStringView = ffi.typeof'WGPUStringView'
ffi.metatype(WGPUStringView, {
	__tostring = function(s)
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
	-- init here
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

	do
		local function callback(
		--[=[
			status,		-- WGPURequestAdapterStatus 
			adapter,	-- WGPUAdapter 
			--[[
			message,	-- WGPUStringView ... though I converted it to a *
			--]]
			-- [[
			message_data,	-- char const * 
			message_length,	-- size_t 
			--]]
			userdata1,	-- void * 
			userdata2	-- void *
		--]=]
		)
print('callback')			
do return end			
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
			print(" - backendType: 0x" .. ('%x'):format(properties.backendType))
			print(" - adapterType: 0x" .. ('%x'):format(properties.adapterType))

			local features = WGPUSupportedFeatures()
			wgpu.wgpuAdapterGetFeatures(adapter, features)
			print("Adapter features:")
			for i=0,features.featureCount-1 do
				print((" - 0x%08x"):format(features.features[i]))
			end

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
					print(' '..field..' = '..limits[k])
				end
			end

			if status == wgpu.WGPURequestAdapterStatus_Success then
				self.adapter = adapter
				print'here'
			else
				--[[
				print("Could not get WebGPU adapter: " .. message)
				--]]
				-- [[
				print("Could not get WebGPU adapter:", message_data, message_length)
				--]]
			end
		end
		--local closure = ffi.cast(WGPURequestAdapterCallback, callback)	-- can't convert
		--local closure = ffi.cast('void (*)(WGPURequestAdapterStatus status, WGPUAdapter adapter, WGPUStringView message, void* userdata1, void* userdata2)', callback)	-- can't convert
		-- luajit cannot handle pass-by-value structs in callbacks 
		local closure = ffi.cast('void (*)(WGPURequestAdapterStatus status, WGPUAdapter adapter, WGPUStringView* message, void* userdata1, void* userdata2)', callback)	-- segfault
		--local closure = ffi.cast('void (*)(WGPURequestAdapterStatus status, WGPUAdapter adapter, char const * message_data, size_t message_length, void* userdata1, void* userdata2)', callback)	-- can't convert
		--[=[
ffi.cdef[[
WGPUFuture wgpuInstanceRequestAdapter(
	WGPUInstance instance,
	WGPURequestAdapterOptions const * options,
	WGPURequestAdapterCallbackInfo callbackInfo // webgpu.h has pass-struct-by-value
);
]]	
		--]=]
		-- [=[ where in the pass-by-value are e getting segafults?
ffi.cdef[[		
WGPUFuture wgpuInstanceRequestAdapter(
	WGPUInstance instance,
	WGPURequestAdapterOptions const * options,
	WGPURequestAdapterCallbackInfo * callbackInfo // me converting to pointer to try to keep luajit from segfaulting
);
]]
		--]=]
		wgpu.wgpuInstanceRequestAdapter(
			self.insance,
			ffi.new('WGPURequestAdapterOptions[1]', {
				compatibleSurface = self.surface,
			}),
			WGPURequestAdapterCallbackInfo{
				mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
				callback = closure,
				--callback = callback,
			}
		)	
		--closure:free()
print('adapter', self.adapter)
	end
end

function WebGPUApp:update()
	-- handle update
end

function WebGPUApp:resize()
	WebGPUApp.super.resize(self)
	-- handle resize
	
end

function WebGPUApp:exit()
	-- shutdown here
	WebGPUApp.super.exit(self)
end

return WebGPUApp():run()
