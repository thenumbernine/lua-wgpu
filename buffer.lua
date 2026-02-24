require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUBufferDescriptor = ffi.typeof'WGPUBufferDescriptor'

local WGPUBuffer = class()
WGPUBuffer.__name = 'WGPUBuffer'

function WGPUBuffer:init(args)
	local device = assert.index(args, 'device')
	args.device = nil
	self.id = wgpu.wgpuDeviceCreateBuffer(
		device,
		WGPUBufferDescriptor(args)
	)
end

function WGPUBuffer:getSize()
	return wgpu.wgpuBufferGetSize(self.id)
end

function WGPUBuffer:__len()
	return self:getSize()
end

function WGPUBuffer:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUBuffer:destroy()
	if self.id then
		wgpu.wgpuBufferRelease(self.id)
		self.id = nil
	end
end

function WGPUBuffer:__gc()
	self:destroy()
end

return WGPUBuffer
