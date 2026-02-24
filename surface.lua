require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'
local WGPUStringView = require 'wgpu.stringview'

local WGPUSurfaceDescriptor = ffi.typeof'WGPUSurfaceDescriptor'
local WGPUSurfaceConfiguration = ffi.typeof'WGPUSurfaceConfiguration'
local WGPUSurfaceTexture = ffi.typeof'WGPUSurfaceTexture'

local WGPUSurface = class()
WGPUSurface.__name = 'WGPUSurface'

function WGPUSurface:init(args)
	self.instance = assert.index(args, 'instance')
	args.instance = nil
	self.id = wgpu.wgpuInstanceCreateSurface(
		self.instance.id,
		WGPUSurfaceDescriptor(args)
	)
end

-- this is an instance method
-- but it depends on surface
-- and surface depends on instance
-- so I put it here
function WGPUSurface:findAdapter(args)
	local WGPUAdapter = require 'wgpu.adapter'
	local adapterObj = WGPUAdapter{
		compatibleSurface = self,
	}
	return adapterObj
end

--[[
it'd be nice to not have to re-pass device over and over
but by design, interface creates surface,
and interface creates device,
so surface and device remain separate until this call
--]]
function WGPUSurface:configure(args)
	wgpu.wgpuSurfaceConfigure(
		self.id,
		WGPUSurfaceConfiguration(args)
	)
	return self
end

function WGPUSurface:getCurrentTexture()
	local surfaceTexture = WGPUSurfaceTexture()
	wgpu.wgpuSurfaceGetCurrentTexture(self.id, surfaceTexture)

	if surfaceTexture.status ~= wgpu.WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal
	and surfaceTexture.status ~= wgpu.WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal
	then
		return nil, "wgpuSurfaceGetCurrentTexture failed with status " .. tostring(surfaceTexture.status)
	end

	local WGPUTexture = require 'wgpu.texture'
	return WGPUTexture{
		id = surfaceTexture,
	}
end

function WGPUSurface:present()
	wgpu.wgpuSurfacePresent(self.id)
	return self
end

function WGPUSurface:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUSurface:destroy()
	if self.id then
		--wgpu.wgpuSurfaceUnconfigure(self.id)	-- does it matter?
		wgpu.wgpuSurfaceRelease(self.id)
		self.id = nil
	end
end

function WGPUSurface:__gc()
	self:destroy()
end

return WGPUSurface
