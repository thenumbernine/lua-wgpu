require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'

-- TODO hmm
-- my classnames match the underlying ffi ctype names
-- that might get confusing

local WGPUDeviceLostCallback = ffi.typeof'WGPUDeviceLostCallback'
local WGPUUncapturedErrorCallback = ffi.typeof'WGPUUncapturedErrorCallback'
local WGPUSupportedFeatures = ffi.typeof'WGPUSupportedFeatures'
local WGPULimits = ffi.typeof'WGPULimits'
local WGPUDeviceDescriptor = ffi.typeof'WGPUDeviceDescriptor'
local WGPURequestDeviceCallbackInfo = ffi.typeof'WGPURequestDeviceCallbackInfo'
local WGPURequestDeviceCallback = ffi.typeof'WGPURequestDeviceCallback'

local WGPUDevice = class()
WGPUDevice.__name = 'WGPUDevice'

function WGPUDevice:init(args)

	-- is label necessary?
	-- TODO put this in a makeWGPUDeviceDescriptor() function? or WGPUDeviceDescriptor:__new ?
	if type(args.label) == 'nil' then
		args.label = WGPUStringView'default device'
	elseif type(args.label) ~= 'cdata' then
		args.label = WGPUStringView(tostring(args.label))
	end

	if args.defaultQueue
	and args.defaultQueue.label
	and type(args.defaultQueue.label) == 'string'
	then
		args.defaultQueue.label = WGPUStringView(args.defaultQueue.label)
	end

	if args.deviceLostCallbackInfo
	and args.deviceLostCallbackInfo.callback
	then
		-- wrap it with our thing that turns it off upon destroy being called
		local callback = args.deviceLostCallbackInfo.callback
		self.deviceLostCallback = function(
			device, 	-- WGPUDevice const *
			reason, 	-- WGPUDeviceLostReason ,
			message,	-- WGPUStringView *
			userdata1,	-- void*
			userdata2	-- void*
		)
			-- ignore messages after calling wgpuDeviceRelease
			--  or it'll feed us corrupted messages
			if self.ignoreDeviceCallbacks then return end

			-- TODO convert device to WGPUDevice? or just use 'self'?

			message = message.length > 0
				and message.data ~= nil
				and tostring(message)
				or nil

			callback(
				device, 	-- WGPUDevice const *
				reason, 	-- WGPUDeviceLostReason ,
				message,	-- string
				userdata1,	-- void*
				userdata2	-- void*
			)
		end
		self.deviceLostClosure = ffi.cast(WGPUDeviceLostCallback, self.deviceLostCallback)
		args.deviceLostCallbackInfo.callback = self.deviceLostClosure
	end

	if args.uncapturedErrorCallbackInfo
	and args.uncapturedErrorCallbackInfo.callback
	then
		local callback = args.uncapturedErrorCallbackInfo.callback
		self.uncapturedErrorCallback = function(
			device,		-- WGPUDevice const *
			errorType,	-- WGPUErrorType
			message,	-- WGPUStringView *
			userdata1,	-- void*
			userdata2	-- void*
		)
			-- ignore messages after calling wgpuDeviceRelease
			--  or it'll feed us corrupted messages
			if self.ignoreDeviceCallbacks then return end

			-- TODO convert device to WGPUDevice? or just use 'self'?

			message = message.length > 0
				and message.data ~= nil
				and tostring(message)
				or nil

			callback(
				device,		-- WGPUDevice const *
				errorType,	-- WGPUErrorType
				message,	-- string
				userdata1,	-- void*
				userdata2	-- void*
			)
		end
		self.uncapturedErrorClosure = ffi.cast(WGPUUncapturedErrorCallback, self.uncapturedErrorCallback)
		args.uncapturedErrorCallbackInfo.callback = self.uncapturedErrorClosure
	end

	local resultDevice
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
			resultDevice = device
		else
			print("Could not get WebGPU device: " .. message)
		end
	end
	local requestDeviceClosure = ffi.cast(WGPURequestDeviceCallback, self.requestDeviceCallback)

	wgpu.wgpuAdapterRequestDevice(
		assert.index(args, 'adapter').id,
		WGPUDeviceDescriptor(args),
		WGPURequestDeviceCallbackInfo{
			mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
			callback = requestDeviceClosure,
		}
	)
	assert(resultDevice, 'wgpuAdapterRequestDevice: failed to find device')
	self.id = resultDevice

	self.requestDeviceCallback = nil
	requestDeviceClosure:free()
end

function WGPUDevice:getQueue(args)
	args = args or {}
	args.device = self
	local WGPUQueue = require 'wgpu.queue'
	return WGPUQueue(args)
end

function WGPUDevice:makeEncoder(args)
	args = args or {}
	args.device = self
	local WGPUEncoder = require 'wgpu.encoder'
	return WGPUEncoder(args)
end

function WGPUDevice:tick()
	wgpu.wgpuDeviceTick(self.id)
	return self
end

function WGPUDevice:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUDevice:destroy()
	if self.id then
		self.ignoreDeviceCallbacks = true
		wgpu.wgpuDeviceRelease(self.id)
		self.id = nil
	end
end

function WGPUDevice:__gc()
	self:destroy()
end

return WGPUDevice
