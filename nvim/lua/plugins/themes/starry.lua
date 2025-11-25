return {
    'ray-x/starry.nvim',
    init = function()
	vim.g.starry_italic_comments = true
    end,
    opts = {
	border = false,
	hide_eob = true,
	italics = {
	    comments = false,
	    strings = false,
	    keywords = false,
	    functions = false,
	    variables = false
	},

	contrast = {
	    enable = true,
	    terminal = true,
	    filetypes = {},
	},

	text_contrast = {
	    lighter = false,
	    darker = false
	},

	disable = {
	    background = false,
	    term_colors = false,
	    eob_lines = false
	},

	style = {
	    name = 'moonlight',

	    disable = {},
	    fix = true,
	    darker_contrast = false,
	    daylight_swith = false,
	    deep_black = false,
	},

	custom_colors = {
	    variable = '#f797d7',
	},
	custom_highlights = {
	    LineNr = { fg = '#777777' },
	    Idnetifier = { fg = '#ff4797' },
	}
    }
}
