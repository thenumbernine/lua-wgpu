require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'

local WGPUCommandEncoderDescriptor = ffi.typeof'WGPUCommandEncoderDescriptor'

local WGPUEncoder = class()
WGPUEncoder.__name = 'WGPUEncoder'

function WGPUEncoder:init(args)
	local device = assert.index(args, 'device')
	args.device = nil

	if type(args.label) == 'string' then
		args.label = WGPUStringView(args.label)
	end

	self.id = wgpu.wgpuDeviceCreateCommandEncoder(
		device.id,
		WGPUCommandEncoderDescriptor(args)
	)
end

function WGPUEncoder:beginRenderPass(args)
	args = args or {}
	args.encoder = self
	local WGPURenderPass = require 'wgpu.renderpass'
	return WGPURenderPass(args)
end

function WGPUEncoder:finish(args)
	args = args or {}
	args.encoder = self
	local WGPUCmdBuf = require 'wgpu.cmdbuf'
	return WGPUCmdBuf(args)
end

function WGPUEncoder:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUEncoder:destroy()
	if self.id then
		wgpu.wgpuCommandEncoderRelease(self.id)
		self.id = nil
	end
end

function WGPUEncoder:__gc()
	self:destroy()
end

return WGPUEncoder
