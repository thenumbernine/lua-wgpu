local ffi = require 'ffi'
local string = require 'ext.string'

local WGPUStringView = ffi.typeof'WGPUStringView'

ffi.metatype(WGPUStringView, {
	__name = 'WGPUStringView',	-- I wonder if LuaJIT does anything with this ...
	__new = function(ctype, ...)
		local o = ffi.new(ctype)
		if select('#', ...) == 1
		and type(select(1, ...)) == 'string'
		then
			local s = ...
			o.data = s
			o.length = #s
		else
			o.data, o.length = ...
		end
		return o
	end,
	__tostring = function(s)
		if s.length == 0 then return '' end
		if s.data == nil then return '(null)' end
-- getting corrupted data
-- probably because I converted the pass-as-struct-value to pointer
-- and it especially happens on shutdown...
		if s.length > 100000 then
			print(
				'WGPUStringView error: length='..tostring(s.length)
					..' data='..tostring(s.data)..
					'\n'
					..debug.traceback()
			)
			return ''
		end
		return ffi.string(s.data, s.length)
	end,
	__concat = string.concat,
})

return WGPUStringView
