require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'

local WGPUCommandBuffer_1 = ffi.typeof'WGPUCommandBuffer[1]'
local WGPUCommandBufferDescriptor = ffi.typeof'WGPUCommandBufferDescriptor'

local WGPUCmdBuf = class()
WGPUCmdBuf.__name = 'WGPUCmdBuf'

function WGPUCmdBuf:init(args)
	local encoder = assert.index(args, 'encoder')
	args.encoder = nil

	if type(args.label) == 'string' then
		args.label = WGPUStringView(args.label)
	end

	self.idptr = WGPUCommandBuffer_1()
	self.idptr[0] = wgpu.wgpuCommandEncoderFinish(
		encoder.id,
		WGPUCommandBufferDescriptor(args)
	)
	self.id = self.idptr[0]
end

function WGPUCmdBuf:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUCmdBuf:destroy()
	if self.id then
		wgpu.wgpuCommandBufferRelease(self.id)
		self.id = nil
	end
end

function WGPUCmdBuf:__gc()
	self:destroy()
end

return WGPUCmdBuf
