local vim = vim

-- vim base config pre-loading of lazy plugins

-- vim configs
--
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.opt.fillchars =  {eob = " "}
vim.opt.swapfile = false

vim.opt.termguicolors = true

-- vim custom base keymap
local map = vim.keymap.set

-- map opts autofill function
local function opts(desc)
    return {desc = "Nvim: "..desc, silent = true, nowait=true, noremap = false}
end

-- normal map
local function nmap(lhs,rhs,options)
    return map("n", lhs, rhs, options)
end

map({'n', 'i'},'<C-s>', function() vim.api.nvim_command('write') end, { desc = 'Save File' })

map(
    {'n', 'i'},
    "<C-\\>",
    "<Esc>:"
    ,
    {
	desc = "Open commandline",
	noremap = false
    }
)

-- window size operations
nmap("<C-w>[", "<C-w><", {desc = "Decrease Window Width", noremap = false})
nmap("<C-w>]", "<C-w>>", {desc = "Increase Window Width", noremap = false})
