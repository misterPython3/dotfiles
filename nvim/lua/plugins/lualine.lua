return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
	options = {
	    refresh = {
		events = {
		    'RecordingEnter',
		    'RecordingLeave',
		}
	    }
	},
	sections = {
	    lualine_a = {
		'mode',
		{
		    function()
			local recording = vim.fn.reg_recording()
			return (recording == "" and "" or ("Recording@"..recording))
		    end
		}
	    },
	    lualine_c = {
		{
		    'filename',
		    path = 4
		}
	    }
	}
    }
}
