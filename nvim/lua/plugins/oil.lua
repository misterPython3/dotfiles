return {
    'stevearc/oil.nvim',
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    opts = {
	use_default_keymaps = false,
	keymaps = {
	    ["q"] = "actions.close",
	    ["<Leader>e"] = "actions.close",
	    ["h"] = "actions.parent",
	    ["l"] = "actions.select",
	    ["."] = "actions.toggle_hidden",
	    ["<Esc>"] = { "actions.close", mode = "n" },
	    ["<C-c>"] = { "actions.close", mode = "n" },
	},
	float = {
	    padding = 0,
	    max_width = 0.64,
	    max_height = 0.64,
	    border = "single",
	},
    },
}
