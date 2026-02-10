#!/usr/bin/env luajit
local ffi = require 'ffi'
local SDLApp = require 'sdl.app'
local webgpu = require 'webgpu.ffi.webgpu'

local WebGPUApp = SDLApp:subclass()
WebGPUApp.title = 'WebGPU App'

function WebGPUApp:initWindow()
	WebGPUApp.super.initWindow(self)
	WebGPUApp:initWebGPU()
end

-- override for post-webgpu-init stuff 
function WebGPUApp:initWebGPU()
	-- init here
end

function WebGPUApp:update()
	-- handle update
end

function WebGPUApp:resize()
	WebGPUApp.super.resize(self)
	-- handle resize
	
end

function WebGPUApp:exit()
	-- shutdown here
	WebGPUApp.super.exit(self)
end

return WebGPUApp():run()
