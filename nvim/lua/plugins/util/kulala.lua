return {
    "mistweaverco/kulala.nvim",
    keys = {
	{ "<leader>Kss", desc = "Send request" },
	{ "<leader>Ksa", desc = "Send all requests" },
	{ "<leader>Ke", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
	global_keymaps = false,
	global_keymaps_prefix = "<leader>K",
	kulala_keymaps_prefix = "",
    },
}
