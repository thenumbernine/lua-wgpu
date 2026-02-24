require 'ext.gc'
local ffi = require 'ffi'
local class = require 'ext.class'
local assert = require 'ext.assert'
local wgpu = require 'wgpu'

local WGPUQueueWorkDoneCallback = ffi.typeof'WGPUQueueWorkDoneCallback'
local WGPUQueueWorkDoneCallbackInfo = ffi.typeof'WGPUQueueWorkDoneCallbackInfo'

local WGPUQueue = class()
WGPUQueue.__name = 'WGPUQueue'

function WGPUQueue:init(args)
	local device = assert.index(args, 'device')
	self.id = wgpu.wgpuDeviceGetQueue(device.id)

	if args.workDoneCallback then
		local callback = args.workDoneCallback
		self.workDoneCallback = function(
			status,		-- WGPUQueueWorkDoneStatus
			message,	-- WGPUStringView*
			userdata1,	-- void*
			userdata2	-- void*
		)
			message = message.length > 0
				and message.data ~= nil
				and tostring(message)
				or nil

			callback(
				status,		-- WGPUQueueWorkDoneStatus
				message,	-- string
				userdata1,	-- void*
				userdata2	-- void*
			)
		end
		local queueWorkDoneClosure = ffi.cast(WGPUQueueWorkDoneCallback, self.workDoneCallback)
		wgpu.wgpuQueueOnSubmittedWorkDone(
			self.id,
			WGPUQueueWorkDoneCallbackInfo{
				mode = wgpu.WGPUCallbackMode_AllowSpontaneous,
				callback = queueWorkDoneClosure,
			}
		)
		-- can we free it or bad idea?
	end
end

function WGPUQueue:writeBuffer(...)
	wgpu.wgpuQueueWriteBuffer(
		self.id,
		...
	)
	return self
end

function WGPUQueue:submit(cmdbuf)
	wgpu.wgpuQueueSubmit(self.id, 1, cmdbuf.idptr)
end

function WGPUQueue:__tostring()
	return self.__name..'('..tostring(self.id)..')'
end

function WGPUQueue:destroy()
	if self.id then
		wgpu.wgpuQueueRelease(self.id)
		self.id = nil
	end
end

function WGPUQueue:__gc()
	self:destroy()
end

return WGPUQueue
