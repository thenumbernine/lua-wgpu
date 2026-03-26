require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUBindGroupDescriptor = ffi.typeof'WGPUBindGroupDescriptor'

local WGPUBindGroup = class()
WGPUBindGroup.__name = 'WGPUBindGroup'

function WGPUBindGroup:init(args)
	local device = assert.index(args, 'device')
	args.device = nil
	self.id = wgpu.wgpuDeviceCreateBindGroup(
		device,
		WGPUBindGroupDescriptor(args)
	)
end

function WGPUBindGroup:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUBindGroup:destroy()
	if self.id then
		wgpu.wgpuBindGroupRelease(self.id)
		self.id = nil
	end
end

function WGPUBindGroup:__gc()
	self:destroy()
end

return WGPUBindGroup
