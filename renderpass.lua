require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'

local WGPURenderPassDescriptor = ffi.typeof'WGPURenderPassDescriptor'

local WGPURenderPass = class()
WGPURenderPass.__name = 'WGPURenderPass'

function WGPURenderPass:init(args)
	local encoder = assert.index(args, 'encoder')
	args.encoder = nil

	if type(args.label) == 'string' then
		args.label = WGPUStringView(args.label)
	end

	self.id = wgpu.wgpuCommandEncoderBeginRenderPass(
		encoder.id,
		WGPURenderPassDescriptor(args)
	)
end

function WGPURenderPass:setPipeline(pipeline)
	wgpu.wgpuRenderPassEncoderSetPipeline(
		self.id,
		pipeline.id
	)
	return self
end

function WGPURenderPass:setVertexBuffer(...)
	wgpu.wgpuRenderPassEncoderSetVertexBuffer(
		self.id, ...
	)
	return self
end

function WGPURenderPass:draw(...)
	wgpu.wgpuRenderPassEncoderDraw(
		self.id, ...
	)
	return self
end

function WGPURenderPass:done()
	wgpu.wgpuRenderPassEncoderEnd(self.id)
	return self
end

function WGPURenderPass:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPURenderPass:destroy()
	if self.id then
		wgpu.wgpuRenderPassEncoderRelease(self.id)
		self.id = nil
	end
end

function WGPURenderPass:__gc()
	self:destroy()
end

return WGPURenderPass
