return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    lazy = false,
    dependencies = {
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope-file-browser.nvim'
    },
    config = function ()
	require('telescope').setup{

	}
    end
}
