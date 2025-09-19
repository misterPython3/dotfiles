return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    config = function()
	local blink_cmp = require('blink.cmp')

	blink_cmp.setup{
	    snippets = { preset = 'luasnip' },
	    keymap = {
		preset = 'none',
		["<CR>"] = {function(cmp) cmp.accept({ on_ghost_text = true}) end, 'accept','fallback'},
		['<Tab>'] = { 'select_next', 'fallback'},
		['<S-Tab>'] = {'select_prev','fallback'},
		['<C-space>'] = {'show', 'show_documentation', 'hide_documentation'},
		['<C-e>'] = {'hide'}
	    },
	    completion = { documentation = { auto_show = true } },

	    sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer', 'omni' },
	    },
	    fuzzy = { implementation = "lua" }
	}
    end,
    opts_extend = { "sources.default" }
}
