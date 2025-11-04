return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	local alpha = require"alpha"
	local dashboard = require'alpha.themes.dashboard'

	dashboard.section.header.val = {
	    '',
	    '',
	    '',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡯⢙⢍⣛⣶⣤⠴⠶⠦⢤⣤⣀⡀⠀⠀⢀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⣨⡾⠋⠁⠀⠀⠀⠀⠀⠀⠉⠙⠷⠛⣫⠍⣻⢍⠹⡆⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠢⡄⠀⢸⠀⣷⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢢⣼⠀⣿⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⣴⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⡏⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⢀⣴⣶⢿⡷⣆⠀⠀⠿⠿⠟⢀⣀⠀⠀⠀⢰⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⣾⣥⠛⡘⢳⡾⡇⠀⠀⠀⡀⠸⣿⠟⠀⠀⠘⠻⠟⠃⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⢻⡈⠿⠿⠿⠀⣧⠀⠀⠀⠛⠛⠻⠦⠤⠴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⢸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⣠⡟⠀⠀⠀⠀⠀⠀',
	    '⠀⠀⠀⠀⠀⠸⣇⠀⠀⠀⠀⠀⠻⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠛⠉⠉⠙⢷⣾⠋⠀⠀⠀⠀⠀⠀⠀',
	    '⠀⣀⣀⣀⣀⣠⣿⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣸⡇⣶⠀⣆⢀⣶⣿⣀⣀⣀⣀⣀⣀⡀⠀',
	    '⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠛⠻⠛⠋⠉⠉⠉⠉⠉⠉⠉⠉⠁',
	    '',
	}
	dashboard.section.buttons.val = {
	    dashboard.button("o","  Recently Opened Files", ":FzfLua oldfiles<CR>"),
	    dashboard.button("n","󰈔  New File", ":ene <BAR> startinsert <CR>"),
	    dashboard.button("f","󰱼  Search File", ":FzfLua files<CR>"),
	    dashboard.button("e","  Oil: Open", function () require('oil').toggle_float() end),
	    dashboard.button("E","󰙅  NvimTree: Toggle", function() require('nvim-tree.api').tree.toggle() end),
	    dashboard.button("y","󰉓  Yazi: Open", ":Yazi<CR>"),
	    dashboard.button("s","  Persistence: Select Session", function() require("persistence").select() end),
	    dashboard.button("l","  Persistence: Last Session", function() require("persistence").load({last=true}) end),
	    dashboard.button("c","  Select Colorscheme", ":FzfLua colorschemes<CR>"),
	    dashboard.button("z","󰚀  Toggle Zen Mode", function() require("zen-mode").toggle{window = {width = 1.0}} end),
	    dashboard.button("q","󰅚  Quit NVIM", ":qa<CR>"),
	}
	alpha.setup(
	    dashboard.config
	)
    end,
}
