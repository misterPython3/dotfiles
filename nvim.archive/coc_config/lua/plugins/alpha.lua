return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	local alpha = require"alpha"
	local dashboard = require'alpha.themes.dashboard'


	dashboard.section.header.val = {
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
             dashboard.button( "n", "  New File" , ":ene <BAR> startinsert <CR>"),
	     dashboard.button("o","  Recently Opened Files", ":FzfLua oldfiles<CR>"),
	     dashboard.button("f","  Search File", ":FzfLua files<CR>"),
	     dashboard.button("e","  Open File Explorer", ":Oil --float<CR>"),
	     dashboard.button("pol","  Open Last Session", function() require("persistence").load({last=true}) end),
             dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
	}
	alpha.setup(
	    dashboard.config
	)
    end,
}
