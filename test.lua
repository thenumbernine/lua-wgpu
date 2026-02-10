#!/usr/bin/env luajit
local ffi = require 'ffi'

ffi.load'bin/Linux/x64/libwebgpu_dawn.so'

local App = require 'sdl.app':subclass()

--return App():run()
