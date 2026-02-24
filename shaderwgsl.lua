local ffi = require 'ffi'
local assert = require 'ext.assert'
local WGPUShader = require 'wgpu.shader'
local wgpu = require 'wgpu'

local WGPUChainedStruct_ptr = ffi.typeof'WGPUChainedStruct*'
local WGPUShaderSourceWGSL = ffi.typeof'WGPUShaderSourceWGSL'

local WGPUShaderWGSL = WGPUShader:subclass()
WGPUShaderWGSL.__name = 'WGPUShaderWGSL'

function WGPUShaderWGSL:init(args)
	local code = assert.type(assert.index(args, 'code'), 'string')
	args.code = nil

	-- goes to the WGPUShaderModuleDescriptor args
	args.nextInChain = ffi.cast(
		WGPUChainedStruct_ptr,
		WGPUShaderSourceWGSL{
			chain = {
				sType = wgpu.WGPUSType_ShaderSourceWGSL,
			},
			code = {
				data = code,
				length = #code,
			},
		}
	)

	WGPUShaderWGSL.super.init(self, args)
end

return WGPUShaderWGSL
