local vim = vim

map = vim.keymap.set
DEFAULT_OPTION = {
    silent = true,
    nowait = true,
    noremap = false,
    desc = "No Description"
}

function f_apply(func, ...)
    local wrapper_arg = ...
    return function()
	return func(wrapper_arg)
    end
end
function f_cmd(cmd)
    return f_apply(vim.cmd, cmd)
end
function cmd_t(cmd)
    return "<Cmd>"..cmd.."<CR>"
end
-- @param new_table table
-- @param default table
function default_table(new_table,default)
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
d_opt = function (opt)
    return default_table(opt, DEFAULT_OPTION)
end
meta_opt_desc = function(opt)
    return function (desc)
    	return default_table({desc=desc},opt)
    end
end
d_desc = function(desc)
    if desc == nil then
    	return DEFAULT_OPTION
    end
    return d_opt{desc=desc}
end

metamap = function(mode, default_opt)
    return function(lhs,rhs, opt)
	return map(mode,lhs,rhs, default_table(opt,default_opt))
    end
end
default_opt_metamap = function(mode) return metamap(mode, DEFAULT_OPTION) end
nmap = default_opt_metamap("n")
imap = default_opt_metamap("i")
nimap = default_opt_metamap({"n","i"})

local __formatter = function(title,desc)
	return title..": "..desc
    end
formatter = function(title)
    return function(desc)
	return __formatter(title,desc)
    end
end
local __formatter_desc = function(title,desc)
    return {desc=__formatter(title,desc)}
end
formatter_desc = function(title)
    return function(desc)
	return __formatter_desc(title,desc)
    end
end
local __formatter_opt_desc = function(opt,title,desc)
    return default_table(__formatter_desc(title,desc),opt)
end
formatter_opt_desc = function(opt, title)
    return function(desc)
	return __formatter_opt_desc(opt,title,desc)
    end
end
formatter_d_desc = function (title)
    return function(desc)
	return __formatter_opt_desc(DEFAULT_OPTION,title,desc)
    end
end
