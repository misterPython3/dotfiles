return {
    'marko-cerovac/material.nvim',
    init = function ()
    	vim.g.material_style = "lighter"
    end,
    opts = {
	contrast = {
	    terminal = true,
	    sidebars = true,
	    floating_windows = true,
	    cursor_line = true,
	    lsp_virtual_text = true,
	    non_current_windows = true,
	    filetypes = {},
	},

	styles = {
	    comments = { --[[ italic = true ]] },
	    strings = { --[[ bold = true ]] },
	    keywords = { --[[ underline = true ]] },
	    functions = { --[[ bold = true, undercurl = true ]] },
	    variables = {},
	    operators = {},
	    types = {},
	},

	plugins = {
	    "blink",
	    "coc",
	    "colorful-winsep",
	    "dap",
	    "dashboard",
	    "eyeliner",
	    "fidget",
	    "flash",
	    "gitsigns",
	    "harpoon",
	    "hop",
	    "illuminate",
	    "indent-blankline",
	    "lspsaga",
	    "mini",
	    "neo-tree",
	    "neogit",
	    "neorg",
	    "neotest",
	    "noice",
	    "nvim-cmp",
	    "nvim-navic",
	    "nvim-notify",
	    "nvim-tree",
	    "nvim-web-devicons",
	    "rainbow-delimiters",
	    "sneak",
	    "telescope",
	    "trouble",
	    "which-key",
	},

	disable = {
	    colored_cursor = true, -- Disable the colored cursor
	    borders = false, -- Disable borders between vertically split windows
	    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
	    term_colors = false, -- Prevent the theme from setting terminal colors
	    eob_lines = false -- Hide the end-of-buffer lines
	},

	high_visibility = {
	    lighter = true, -- Enable higher contrast text for lighter style
	    darker = false -- Enable higher contrast text for darker style
	},

	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

	custom_colors = nil, -- If you want to override the default colors, set this to a function

	custom_highlights = {}, -- Overwrite highlights with your own
    }
}

