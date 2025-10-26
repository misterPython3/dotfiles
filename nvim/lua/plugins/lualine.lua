return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	require("lualine").setup{
	    refresh = {
		events = {
		    "RecordingEnter",
		    "RecordingLeave",
		},
	    },
	    sections = {
		lualine_a = {
		    "mode",
		    function()
			local rec = vim.fn.reg_recording()
			return rec ~= "" and "Recording @"..rec or ""
		    end,
		},
		lualine_x = {
		    'encoding',
		    'fileformat',
		    'filetype'
		},
	    },
	}
    end,
}
