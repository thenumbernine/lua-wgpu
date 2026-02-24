require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUTextureViewDescriptor = ffi.typeof'WGPUTextureViewDescriptor'

local WGPUTexture = class()
WGPUTexture.__name = 'WGPUTexture'

function WGPUTexture:init(args)
	self.id = assert.index(args, 'id')
end

function WGPUTexture:makeView(args)
	local texture = assert.index(args, 'texture')
	args.texture = nil
	local view = wgpu.wgpuTextureCreateView(
		texture,
		WGPUTextureViewDescriptor(args)
	)
	if view == nil then return nil end
	local WGPUView = require 'wgpu.view'
	return WGPUView{
		id = view,
	}
end

function WGPUTexture:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUTexture:destroy()
	if self.id then
		-- don't release textures passed from wgpuSurfaceGetCurrentTexture
		--wgpu.wgpuTextureRelease(self.id)
		self.id = nil
	end
end

function WGPUTexture:__gc()
	self:destroy()
end

return WGPUTexture
