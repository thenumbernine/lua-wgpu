require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUAdapterInfo = ffi.typeof'WGPUAdapterInfo'
local WGPUSupportedFeatures = ffi.typeof'WGPUSupportedFeatures'
local WGPULimits = ffi.typeof'WGPULimits'
local WGPURequestAdapterCallback = ffi.typeof'WGPURequestAdapterCallback'
local WGPURequestAdapterOptions = ffi.typeof'WGPURequestAdapterOptions'
local WGPURequestAdapterCallbackInfo = ffi.typeof'WGPURequestAdapterCallbackInfo'
local WGPUSurfaceCapabilities = ffi.typeof'WGPUSurfaceCapabilities'

local WGPUAdapter = class()
WGPUAdapter.__name = 'WGPUAdapter'

function WGPUAdapter:init(args)
	self.surface = assert.index(args, 'compatibleSurface')
	args.compatibleSurface = self.surface.id

	local resultAdapter
	local function callback(
		status,		-- WGPURequestAdapterStatus
		adapter,	-- WGPUAdapter
		message,	-- WGPUStringView *
		userdata1,	-- void *
		userdata2	-- void *
	)
		local properties = WGPUAdapterInfo()
		wgpu.wgpuAdapterGetInfo(adapter, properties)

-- [[ verbose output
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
--]]

		if status == wgpu.WGPURequestAdapterStatus_Success then
			resultAdapter = adapter
		else
			print("Could not get WebGPU adapter: " .. message)
		end
	end
	self.retainCallback = callback
	local closure = ffi.cast(WGPURequestAdapterCallback, callback)	-- can't convert

	-- TODO put this here or in WGPUAdapter:init ?
	wgpu.wgpuInstanceRequestAdapter(
		self.surface.instance.id,
		WGPURequestAdapterOptions(args),
		WGPURequestAdapterCallbackInfo{
			mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
			callback = closure,
		}
	)
	assert(resultAdapter, 'wgpuInstanceRequestAdapter: failed to find adapter')

	self.retainCallback = nil
	closure:free()

	self.id = resultAdapter
end

-- once again, name is Surface, but it requires an Adapter which requires a Surface
function WGPUAdapter:getCapabilities()
	local capabilities = WGPUSurfaceCapabilities()
	wgpu.wgpuSurfaceGetCapabilities(self.surface.id, self.id, capabilities)
	return capabilities
end

function WGPUAdapter:findDevice(args)
	args = args or {}
	args.adapter = self
	local WGPUDevice = require 'wgpu.device'
	return WGPUDevice(args)
end

function WGPUAdapter:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUAdapter:destroy()
	if self.id then
		wgpu.wgpuAdapterRelease(self.id)
		self.id = nil
	end
end

function WGPUAdapter:__gc()
	self:destroy()
end

return WGPUAdapter
