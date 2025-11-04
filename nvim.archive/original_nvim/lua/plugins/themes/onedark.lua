return {
    "navarasu/onedark.nvim",
    config = function()
	require('onedark').setup {
	    -- Options: dark, darker, cool, deep, warm, warmer, light
	    style = 'deep'
	}
	-- Enable theme
	require('onedark').load()
    end
}
