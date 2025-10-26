local cmd_t = require("config.keymaps.func").cmd_t
return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	local alpha_theme = require("alpha.themes.dashboard")
	local function OpenConfig()
	    local config_path = vim.fn.expand("~/.config/nvim")
	    local success = require("auto-session").restore_session(config_path)
	    if not success then
		local init_file = config_path.."/init.lua"
		vim.cmd.edit(vim.fn.filereadable(init_file) and init_file or config_path)
	    end
	end
	alpha_theme.section.header.val = {
	    [[                              ]],
	    [[                              ]],
	    [[⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⢠⣴⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	    [[⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠃⠀⠀⠀⠀⠀⠀⠀⣹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	    [[⠀⠀⠀⠀⠀⠀⠀⠀⠸⣏⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	    [[⠀⠀⠀⠀⠀⠀⠀⠀⣼⢻⣄⣀⣠⣀⣤⣤⣀⡀⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
	    [[⠀⠀⠀⠀⠀⠀⢠⣴⢏⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀]],
	    [[⠀⠀⠀⠀⣠⣾⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀]],
	    [[⠀⣤⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀]],
	    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⠀⠀]],
	    [[⠀⢻⣿⣿⣿⣿⣿⣿⣿⠟⠛⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⠀⠀⠀]],
	    [[⠀⠈⣿⣿⣿⢿⣿⣿⣿⣷⣦⣤⣀⣀⣽⣿⣿⣿⣿⣿⣧⣀⣀⣤⣿⣿⣿⣇⠀⠀]],
	    [[⠀⠘⣿⡿⣼⢿⣯⣿⢿⣿⣿⣿⣿⣿⡯⡝⣎⢿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀]],
	    [[⠀⠀⣿⣹⣭⡟⡿⣞⡿⣯⣟⡿⣳⢷⡹⣜⠠⣈⠵⣯⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀]],
	    [[⠀⠀⠹⣯⣝⡳⣱⢛⡷⣻⢿⢷⣛⡬⢧⡙⠦⣉⠰⣹⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀]],
	    [[⠀⠀⠀⢷⢮⡵⢣⢯⣜⣳⢻⣞⢧⡛⠴⣉⠰⣀⢆⡱⣺⣿⣿⣿⣿⣿⣿⣿⡇⠀]],
	    [[⠀⠀⠀⣾⡑⡎⣝⠲⡜⢆⡳⠜⣎⠿⣳⢭⡳⡵⢮⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀]],
	    [[⠀⠀⠼⠣⠜⠱⠌⠓⠜⠣⠜⠱⠈⠆⠡⠊⠱⠉⠗⠺⠳⠿⠿⠿⠿⠿⠿⠿⠿⠧]],
	}
	alpha_theme.section.buttons.val = {
	    alpha_theme.button("o", "  Recent Files", cmd_t"FzfLua oldfiles"),
	    alpha_theme.button("n", "  New File", cmd_t"enew"),
	    alpha_theme.button("f", "󰱼  Browse Files", cmd_t":FzfLua files"),
	    alpha_theme.button("e", "󰁴  Oil", cmd_t"Oil --float"),
	    alpha_theme.button("s", "󰆔  Select Session", cmd_t"AutoSession search"),
	    alpha_theme.button("r", "  Restore Session", cmd_t"AutoSession restore"),
	    alpha_theme.button("c", "  Colorschemes", cmd_t"FzfLua colorschemes"),
	    alpha_theme.button("C", "  Config", OpenConfig),
	    alpha_theme.button("q", "󰈆  Quit", cmd_t"quit")
	}
	require("alpha").setup(
	    alpha_theme.config
	)
    end,
}
