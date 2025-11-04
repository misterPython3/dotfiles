return  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local config = require("nvim-treesitter.configs")
	config.setup({
	    ensure_installed = {
		"awk",
		"bash",
		"c",
		"glsl",
		"hlsl",
		"rust",
		"cmake",

		"html",
		"javascript",
		"css",
		"svelte",
		"typescript",
		"tsx",
		"vue",

		"c_sharp",
		"razor",
		"java",
		"ruby",
		"python",
		"sql",

		"php",
		"lua",
		"vim",
		"rasi",
		"tmux",
	    },
	    sync_install = false,
	    highlight = {
		enable = true
	    },
	    indent = {
		enable = true
	    },
	})
	end
}
