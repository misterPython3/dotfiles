local vim = vim
local map = vim.keymap.set

-- map opts autofill function
local function opts(desc)
    return {desc = "Nvim: "..desc, silent = true, nowait=true, noremap = false}
end

-- normal map
local function nmap(lhs,rhs,options)
    return map("n", lhs, rhs, options)
end

-- -- nvim-tree keymapping
-- local nvimtree_api = require("nvim-tree.api")
--
-- nmap("<Leader>e", nvimtree_api.tree.toggle, opts("Toggle NvimTree"))

-- fterm keybinds
local fterm = require('FTerm')
map({"i", "n", "t"}, "<C-S-\\>", function() fterm.toggle() end)

-- telescope keymapping
local builtin = require('telescope.builtin')

nmap('<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
nmap('<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
nmap('<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
nmap('<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
nmap("<leader>qs", function() require("persistence").load() end)
nmap("<leader>qS", function() require("persistence").select() end)
nmap("<leader>ql", function() require("persistence").load({ last = true }) end)
nmap("<leader>qd", function() require("persistence").stop() end)

nmap('<leader>fF', '<Cmd>FzfLua<CR>', { desc = 'FzfLua'})
nmap('<leader>fb', '<Cmd>FzfLua buffers<CR>', { desc = 'FzfLua buffers'})
nmap('<leader>ff', '<Cmd>FzfLua files<CR>', { desc = 'FzfLua files'})
nmap('<leader>fo', '<Cmd>FzfLua oldfiles<CR>', { desc = 'FzfLua oldfiles'})
nmap('<leader>fh', '<Cmd>FzfLua highlights<CR>', { desc = 'FzfLua highlights'})
nmap('<leader>fc', '<Cmd>FzfLua colorschemes<CR>', { desc = 'FzfLua colorschemes'})
nmap('<leader>fac', '<Cmd>FzfLua awesome_colorschemes<CR>', { desc = 'FzfLua awesome_colorschemes'})

local options = { noremap = true, silent = true }
map({'n','i'}, '<A-[>','<Cmd>BufferPrevious<CR>', options)
map({'n','i'}, '<A-]>','<Cmd>BufferNext<CR>', options)
map({'n','i'}, '<A-S-[>','<Cmd>BufferMovePrevious<CR>', options)
map({'n','i'}, '<A-S-]>','<Cmd>BufferMoveNext<CR>', options)
map({'n','i'}, '<A-1>','<Cmd>BufferGoto 1<CR>', options)
map({'n','i'}, '<A-2>','<Cmd>BufferGoto 2<CR>', options)
map({'n','i'}, '<A-3>','<Cmd>BufferGoto 3<CR>', options)
map({'n','i'}, '<A-4>','<Cmd>BufferGoto 4<CR>', options)
map({'n','i'}, '<A-5>','<Cmd>BufferGoto 5<CR>', options)
map({'n','i'}, '<A-6>','<Cmd>BufferGoto 6<CR>', options)
map({'n','i'}, '<A-7>','<Cmd>BufferGoto 7<CR>', options)
map({'n','i'}, '<A-8>','<Cmd>BufferGoto 8<CR>', options)
map({'n','i'}, '<A-9>','<Cmd>BufferGoto 9<CR>', options)
map({'n','i'}, '<C-q>','<Cmd>BufferClose<CR>', options)
map({'n','i'}, '<C-S-p>','<Cmd>BufferPick<CR>', options)
map({'n','i'}, '<C-S-Q>','<Cmd>BufferPickDelete<CR>', options)
map({'n','i'}, '<Space><A-p>','<Cmd>BufferPin<CR>', options)
map('n', '<Space>bb','<Cmd>BufferOrderByBufferNumber<CR>', options)
map('n', '<Space>bn','<Cmd>BufferOrderByName<CR>', options)
map('n', '<Space>bd','<Cmd>BufferOrderByDirectory<CR>', options)
map('n', '<Space>bl','<Cmd>BufferOrderByLanguage<CR>', options)
map('n', '<Space>bw','<Cmd>BufferOrderByWindowNumber<CR>', options)

-- load the session for the current directory
nmap("<leader>poc", function() require("persistence").load() end,{desc = "load session on current directory"})
-- select a session to load
nmap("<leader>pos", function() require("persistence").select() end,{desc = "select session"})
-- load the last session
nmap("<leader>pol", function() require("persistence").load({ last = true }) end,{desc = "load last session"})
-- stop Persistence => session won't be saved on exit
nmap("<leader>pq", function() require("persistence").stop() end,{desc = "stop session"})
nmap("<leader>ps", function() require("persistence").save() end,{desc = "save session"})

-- minifiles keybind
local minifiles = require('mini.files')
nmap(
    '<Space>e',
    function()
	if (minifiles.get_explorer_state() == nil) then
	    minifiles.open()
	else
	    minifiles.close()
	end
    end,
    options
)


-- smart splits keybinds
local smart_splits = require('smart-splits')
nmap('<A-S-m>h', smart_splits.resize_left)
nmap('<A-S-m>j', smart_splits.resize_down)
nmap('<A-S-m>k', smart_splits.resize_up)
nmap('<A-S-m>l', smart_splits.resize_right)
nmap('<A-S-h>', smart_splits.move_cursor_left)
nmap('<A-S-j>', smart_splits.move_cursor_down)
nmap('<A-S-k>', smart_splits.move_cursor_up)
nmap('<A-S-l>', smart_splits.move_cursor_right)
nmap('<A-S-m>p', smart_splits.move_cursor_previous)
nmap('<leader><leader>h', smart_splits.swap_buf_left)
nmap('<leader><leader>j', smart_splits.swap_buf_down)
nmap('<leader><leader>k', smart_splits.swap_buf_up)
nmap('<leader><leader>l', smart_splits.swap_buf_right)


options = { noremap = false, silent = true }
nmap('<C-j>','<C-E>',options)
nmap('<C-k>','<C-Y>',options)


