return  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local config = require("nvim-treesitter.configs")
	config.setup({
	    ensure_installed = {
		"lua",
		"vim",
		"html",
		"javascript",
		"c",
		"c_sharp",
		"java",
		"svelte",
		"typescript"
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
