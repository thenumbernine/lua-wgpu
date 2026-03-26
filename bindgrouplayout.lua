require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUBindGroupLayoutDescriptor = ffi.typeof'WGPUBindGroupLayoutDescriptor'

local WGPUBindGroupLayout = class()
WGPUBindGroupLayout.__name = 'WGPUBindGroupLayout'

function WGPUBindGroupLayout:init(args)
	local device = assert.index(args, 'device')
	args.device = nil
	self.id = wgpu.wgpuDeviceCreateBindGroupLayout(
		device,
		WGPUBindGroupLayoutDescriptor(args)
	)
end

function WGPUBindGroupLayout:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUBindGroupLayout:destroy()
	if self.id then
		wgpu.wgpuBindGroupLayoutRelease(self.id)
		self.id = nil
	end
end

function WGPUBindGroupLayout:__gc()
	self:destroy()
end

return WGPUBindGroupLayout
