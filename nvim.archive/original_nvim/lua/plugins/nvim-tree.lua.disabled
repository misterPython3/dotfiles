return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },

    config = function()
	-- pass to setup along with your other options

	require("nvim-tree").setup ({
	    view = {
		float = {
		    enable = true,
		    open_win_config = function ()
			local screen_w = vim.opt.columns:get()
			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local window_w = screen_w * 0.75
			local window_h = screen_h * 0.8
			local center_x = (screen_w - window_w) / 2
			local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
		    	return {
			    border = 'rounded',
			    relative = 'editor',
			    row = center_y,
			    col = center_x,
			    width = math.floor(window_w),
			    height = math.floor(window_h)
			}
		    end
		}
	    },
	    on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
		    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)
		-- custom map
		vim.keymap.set("n", "e", api.node.open.edit, opts("Edit File"))
	    end
	})
    end

}
