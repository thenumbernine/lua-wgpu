require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUShaderModuleDescriptor = ffi.typeof'WGPUShaderModuleDescriptor'

local WGPUShader = class()
WGPUShader.__name = 'WGPUShader'

function WGPUShader:init(args)
	local device = assert.index(args, 'device')
	args.device = nil
	self.id = wgpu.wgpuDeviceCreateShaderModule(
		device,
		WGPUShaderModuleDescriptor(args)
	)
end

function WGPUShader:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUShader:destroy()
	if self.id then
		wgpu.wgpuShaderModuleRelease(self.id)
		self.id = nil
	end
end

function WGPUShader:__gc()
	self:destroy()
end

return WGPUShader
