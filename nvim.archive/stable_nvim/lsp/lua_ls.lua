local vim = vim
return {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = {'.luarc.json', '.luarc.jsonc'},
    settings = {
	Lua = {
	    diagnostics = {
		disable = {
		    "lowercase-global",
		    "undefined-global"
		},
		globals = {
		    "vim",
		    "nvim"
		}
	    },
	    runtime = {
		version = 'LuaJIT',
		path = {
		    'lua/?.lua',
		    'lua/?/init.lua',
		},
	    },
	    workspace = {
		checkThirdParty = false,
		library = {
		    vim.env.VIMRUNTIME
		}
	    }
	}
    }
}
