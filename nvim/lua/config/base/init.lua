local vim = vim

vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.fillchars = {eob = " "}

vim.o.number = true
vim.o.relativenumber = true

vim.o.cmdheight = 0
vim.o.shiftwidth = 4
vim.o.startofline = true

vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.scroll = 10

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.spell = false
vim.o.wildoptions = "fuzzy,pum,tagfile"
vim.o.spelllang = "en_us"
vim.o.complete = "k/usr/share/dict/words,.,w,b,u,t"
vim.o.pumheight = 12

vim.o.autochdir = false
vim.opt.background = "dark"
vim.g.leader = " "
vim.g.mapleader = " "
