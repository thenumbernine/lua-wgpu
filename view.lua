require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUView = class()
WGPUView.__name = 'WGPUView'

function WGPUView:init(args)
	self.id = assert.index(args, 'id')
end

function WGPUView:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUView:destroy()
	if self.id then
		wgpu.wgpuTextureViewRelease(self.id)
		self.id = nil
	end
end

function WGPUView:__gc()
	self:destroy()
end

return WGPUView
