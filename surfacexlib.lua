local ffi = require 'ffi'
local assert = require 'ext.assert'
local sdl = require 'sdl'
local wgpu = require 'wgpu'
local WGPUSurface = require 'wgpu.surface'

local void_ptr = ffi.typeof'void*'
local uint64_t = ffi.typeof'uint64_t'
local WGPUChainedStruct_ptr = ffi.typeof'WGPUChainedStruct*'
local WGPUSurfaceSourceXlibWindow = ffi.typeof'WGPUSurfaceSourceXlibWindow'

local WGPUSurfaceXLib = WGPUSurface:subclass()
WGPUSurfaceXLib.__name = 'WGPUSurfaceXLib'

function WGPUSurfaceXLib:init(args)
	local sdlWindow = assert.index(args, 'sdlWindow')
print('SDL window', sdlWindow)
	args.sdlWindow = nil

	local props = sdl.SDL_GetWindowProperties(sdlWindow)
print('SDL props', props)

	local x11Display = sdl.SDL_GetPointerProperty(props, "SDL.window.x11.display", nil)
print('X11 display', x11Display)
	local x11Window = sdl.SDL_GetNumberProperty(props, "SDL.window.x11.window", 0)
print('X11 window', x11Window)

	args.nextInChain = ffi.cast(WGPUChainedStruct_ptr, WGPUSurfaceSourceXlibWindow{
		chain = {
			sType = wgpu.WGPUSType_SurfaceSourceXlibWindow,
		},
		display = ffi.cast(void_ptr, x11Display),
		window = ffi.cast(uint64_t, x11Window),
	})

	args.label = {
		length = 0xFFFFFFFFFFFFFFFFULL, --SIZE_MAX, should be in c.stdint, or maybe c.limits?
	},

	WGPUSurfaceXLib.super.init(self, args)
end

return WGPUSurfaceXLib
