return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
	lsp = {
	    override = {
	      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	      ["vim.lsp.util.stylize_markdown"] = true,
	      ["cmp.entry.get_documentation"] = true,
	    },
	},
      	presets = {
	    bottom_search = false,
	    command_palette = false,
	    long_message_to_split = true,
	    inc_rename = false,
	    lsp_doc_border = false,
	},
	routes = {
	    {
		filter = {
		    event = "msg_show",
		    kind = '',
		},
		opts = { skip = true }
	    }
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
