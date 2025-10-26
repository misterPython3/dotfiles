local vim = vim
local M = {}
local bindkey = vim.keymap.set
M.bindkey = bindkey

local function create_map(mode)
	return function(key, action, opt)
		return bindkey(mode, key, action, opt)
	end
end
local function apply_template(opt_group,desc)
	return string.format("%s: %s", opt_group, desc)
end

M.add_opt_desc = function (desc, opt)
    return vim.tbl_deep_extend("force", opt, {desc=desc})
end
M.desc_group = function (opt_group)
	return function(desc)
		return apply_template(opt_group,desc)
	end
end
M.desc_opt = function (opt_group)
	return function(desc)
		return {desc=apply_template(opt_group,desc)}
	end
end
M.create_optgroup = function (opt_group,opt)
	return function(desc)
		return vim.tbl_deep_extend("force", opt, {desc=apply_template(opt_group,desc)})
	end
end
M.create_keygroup = function (mode,key_prefix)
	return function(key, action, opt)
		return bindkey(mode, key_prefix..key, action, opt)
	end
end

M.cmd_t = function(cmd)
	return string.format("<Cmd>%s<CR>",cmd)
end

M.nmap = create_map("n")
M.imap = create_map("i")
M.nimap = create_map({"n","i"})
M.tmap = create_map("t")
M.cmap = create_map("c")
M.vmap = create_map("v")

return M
