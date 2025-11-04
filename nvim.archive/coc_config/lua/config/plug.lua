local vim = vim

local autoload_path = vim.fn.stdpath("data") .. "/site/autoload"
local plug_path = autoload_path .. "/plug.vim"
if not (vim.uv or vim.loop).fs_stat(plug_path) then
    local plug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local cmd = {
	"curl",
	"-fLo",
	plug_path,
	"--create-dirs",
	plug_url
    }
    local out = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
	vim.api.nvim_echo(
	    {
		{"Failed to fetch plug:\n", "ErrorMsg"},
		{ out, "WarningMsg"},
		{"\nPress any key to continue..."}
	    },
	    true,
	    {}
	)
	vim.fn.getchar()
	os.exit(1)
    end
end

local Plug = vim.fn['plug#']
vim.call'plug#begin'
vim.call'plug#end'

