require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local char_const_ptr_1 = ffi.typeof'char const *[1]'
local WGPUChainedStruct_ptr = ffi.typeof'WGPUChainedStruct*'
local WGPUInstanceDescriptor = ffi.typeof'WGPUInstanceDescriptor'
local WGPUDawnTogglesDescriptor = ffi.typeof'WGPUDawnTogglesDescriptor'

local WGPUInstance = class()
WGPUInstance.__name = 'WGPUInstance'

function WGPUInstance:init(args)
	self.id = wgpu.wgpuCreateInstance(
		WGPUInstanceDescriptor{
			-- TODO make these all optional? based on `require 'wgpu.debug'`?
			nextInChain = ffi.cast(WGPUChainedStruct_ptr, WGPUDawnTogglesDescriptor{
				chain = {
					sType = wgpu.WGPUSType_DawnTogglesDescriptor,
				},
				enabledToggleCount = 1,
				enabledToggles = char_const_ptr_1{
					"enable_immediate_error_handling"
				},
			})
		}
	)
	assert.ne(self.id, nil, 'wgpuCreateInstance')
end

function WGPUInstance:makeSurface(args)
	--if ffi.os == 'Linux' then
	local WGPUSurfaceXLib = require 'wgpu.surfacexlib'
	return WGPUSurfaceXLib{
		instance = self,
		sdlWindow = args.sdlWindow,
	}
	--else error("idk how to make a surface for your os: "..ffi.os) end
end

function WGPUInstance:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUInstance:destroy()
	if self.id then
		wgpu.wgpuInstanceRelease(self.id)
		self.id = nil
	end
end

function WGPUInstance:__gc()
	self:destroy()
end

return WGPUInstance
