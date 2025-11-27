local M = {}
M.extend = function(dest, src)
	for key,value in pairs(src) do
		rawset(dest,key,value)
	end
end
M.apply = function(callable,...)
    local args = {...}
    return function()
	return callable(unpack(args))
    end
end
return M
