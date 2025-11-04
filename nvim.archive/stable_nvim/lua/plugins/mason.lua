return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
	automatic_enable = true,
	ensure_installed = {
	    "lua_ls",
	    "bashls",

	    "cmake",
	    "clangd",
	    "glslls",
	    "rust_analyzer",

	    "csharp_ls",
	    "omnisharp",
	    "pylsp",
	    "ruby_lsp",
	    "rubocop",

	    "html",
	    "emmet_ls",
	    "cssls",
	    "svelte",
	    "ts_ls",
	    -- "tailwindcss",

	    "intelephense",
	    "sqlls",
	}
    },
}
