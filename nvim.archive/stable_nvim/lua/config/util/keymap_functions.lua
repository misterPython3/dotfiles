local M = {}
local vim = vim
M.map = vim.keymap.set
M.DEFAULT_OPTION = {
    silent = true,
    nowait = true,
    noremap = false,
    desc = "No Description"
}

function M.f_apply(func, ...)
    local wrapper_arg = ...
    return function()
	return func(wrapper_arg)
    end
end
function M.f_cmd(cmd)
    return M.f_apply(vim.cmd, cmd)
end
function M.cmd_t(cmd)
    return "<Cmd>"..cmd.."<CR>"
end
-- @param new_table table
-- @param default table
function M.default_table(new_table,default)
    if new_table == nil then
	return default or {}
    end
    if default == nil then
    	return new_table
    end
    local temp_table = {}
    for key, value in pairs(new_table) do
    	temp_table[key] = value
    end
    setmetatable(new_table, {
	__newindex = function(_,k,v) temp_table[k] = v end
    })
    for key, value in pairs(default) do
	new_table[key] = value
    end
    setmetatable(new_table,{})
    return temp_table
end
M.d_opt = function (opt)
    return M.default_table(opt, M.DEFAULT_OPTION)
end
M.meta_opt_desc = function(opt)
    return function (desc)
    	return M.default_table({desc=desc},opt)
    end
end
M.d_desc = function(desc)
    if desc == nil then
    	return M.DEFAULT_OPTION
    end
    return M.d_opt{desc=desc}
end

M.metamap = function(mode, default_opt)
    return function(lhs,rhs, opt)
	return M.map(mode,lhs,rhs, M.default_table(opt,default_opt))
    end
end
M.default_opt_metamap = function(mode) return M.metamap(mode, M.DEFAULT_OPTION) end
M.nmap = M.default_opt_metamap("n")
M.imap = M.default_opt_metamap("i")
M.nimap = M.default_opt_metamap({"n","i"})

local __formatter = function(title,desc)
	return title..": "..desc
    end
M.formatter = function(title)
    return function(desc)
	return __formatter(title,desc)
    end
end
local __formatter_desc = function(title,desc)
    return {desc=__formatter(title,desc)}
end
M.formatter_desc = function(title)
    return function(desc)
	return __formatter_desc(title,desc)
    end
end
local __formatter_opt_desc = function(opt,title,desc)
    return M.default_table(__formatter_desc(title,desc),opt)
end
M.formatter_opt_desc = function(opt, title)
    return function(desc)
	return __formatter_opt_desc(opt,title,desc)
    end
end
M.formatter_d_desc = function (title)
    return function(desc)
	return __formatter_opt_desc(M.DEFAULT_OPTION,title,desc)
    end
end

return M
