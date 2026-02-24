require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPURenderPipelineDescriptor = ffi.typeof'WGPURenderPipelineDescriptor'

local WGPUPipeline = class()
WGPUPipeline.__name = 'WGPUPipeline'

function WGPUPipeline:init(args)
	local device = assert.index(args, 'device')
	args.device = nil
	self.id = wgpu.wgpuDeviceCreateRenderPipeline(
		device,
		WGPURenderPipelineDescriptor(args)
	)
end

function WGPUPipeline:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUPipeline:destroy()
	if self.id then
		wgpu.wgpuRenderPipelineRelease(self.id)
		self.id = nil
	end
end

function WGPUPipeline:__gc()
	self:destroy()
end

return WGPUPipeline
