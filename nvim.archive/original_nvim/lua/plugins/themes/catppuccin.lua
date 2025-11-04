return {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function ()
	require'catppuccin'.setup{
	    integrations = {
		cmp = true,
		mini = {
		    enabled = true
		},
		notify = true,
		noice = true,

	    },
	}
    end
}
