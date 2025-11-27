return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	build = ":TSUpdate",
	config = function()
		require"nvim-treesitter.configs".setup{
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"vue",
				"angular",

				"c",
				"cpp",
				"rust",
				"c_sharp",
				"cmake",
				"glsl",
				"hlsl",

				"ruby",
				"python",
				"lua",
				"php",
				"blade",
				"sql",
				"robot",

				"bash",
				"vim",
				"tmux",
				"nix",
				"ini",
				"regex",
				"json",
			}
		}
	end,
}
