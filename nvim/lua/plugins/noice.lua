return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
	views = {
	    cmdline_popup = {
		border = {
		    style = "single",
		    padding = {0, 0},
		},
		win_options = {
		    winhighlight = {
			Normal = "Normal",
			NormalFloat = "Normal",
			FloatBorder = "FloatBorder",
		    },
		},
	    },
	},
	messages = {
	    enabled = true,
	},
	notify = {
	    enabled = false,
	},
    },
    dependencies = {
	"MunifTanjim/nui.nvim",
	{
	    "rcarriga/nvim-notify",
	    config = function()
		local notify = require("notify")
		notify.setup({
		    render = "minimal",
		    timeout = 500,
		    background_colour = "#000000",
		    on_open = function(win)
			vim.api.nvim_win_set_config(win, {focusable = false})
		    end
		})
	    end
	},
    }
}
