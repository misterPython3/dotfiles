local vim = vim
require("config.util.keymap_functions")
map({'n', 'i'},'<C-s>', f_apply(vim.api.nvim_command,'write'), { desc = 'Save File' })
nimap("<C-j>", "<C-e>", d_desc"Scroll: Down")
nimap("<C-k>", "<C-y>", d_desc"Scroll: Up")
nimap("<C-w>Q", cmd_t"q!", d_desc"Window: Close Override")

local opts = {silent = true, noremap = true}
nimap("<A-h>","<Left>",opts)
nimap("<A-j>","<Down>",opts)
nimap("<A-k>","<Up>",opts)
nimap("<A-l>","<Right>",opts)

map(
    {"n","v"},
    "<C-\\>",
    ":",
    d_opt{silent = false, desc="Toggle Command Line"}
)
map(
    "i",
    "<C-\\>",
    "<ESC>:",
    d_opt{silent = false, desc="Toggle Command Line"}
)
map(
    "c",
    "<C-\\>",
    "<ESC>",
    d_opt{silent = false, desc="Toggle Command Line"}
)
nmap("<Leader>nh", cmd_t"nohl", d_desc"Turn off search highlights")

nmap("<Leader>a", cmd_t"Alpha", d_desc"Alpha: Open Dashboard")
nmap('<Leader>m', cmd_t"Mason", d_desc"Mason")
nmap('<Leader>l', cmd_t"Lazy", d_desc"Lazy")

local fzf_f = formatter_d_desc"FzfLua"
nmap("<Leader>fF", cmd_t"FzfLua", fzf_f"Builtin")
nmap("<Leader>fb", cmd_t"FzfLua buffers", fzf_f"Buffers")
nmap("<Leader>fm", cmd_t"FzfLua menus", fzf_f"Menus")
nmap("<Leader>ff", cmd_t"FzfLua files", fzf_f"Files")
nmap("<Leader>fo", cmd_t"FzfLua oldfiles", fzf_f"Oldfiles")
nmap("<Leader>fc", cmd_t"FzfLua colorschemes", fzf_f"Colorscheme")
nmap("<Leader>fCc", cmd_t"FzfLua commands", fzf_f"Commands")
nmap("<Leader>fCh", cmd_t"FzfLua command_history", fzf_f"Command History")
nmap("<Leader>fac", cmd_t"FzfLua awesome_colorschemes", fzf_f"Awesome Colorscheme")
nmap("<Leader>fh", cmd_t"FzfLua highlights", fzf_f"Highlights")
nmap("<Leader>fr", cmd_t"FzfLua resume", fzf_f"Resume")
nmap("<Leader>fj", cmd_t"FzfLua jumps", fzf_f"Jumps")
nmap("<Leader>fsh", cmd_t"FzfLua search_history", fzf_f"Search History")

local barbar_opts = { noremap = true, silent = true }
local barbar_t = formatter_opt_desc(barbar_opts, "BarBar")
nimap('<A-[>', cmd_t"BufferPrevious", barbar_t"Previous Buffer")
nimap('<A-]>', cmd_t"BufferNext", barbar_t"Next Buffer")
nimap('<C-S-Tab>', cmd_t"BufferPrevious", barbar_t"Previous Buffer")
nimap('<C-Tab>', cmd_t"BufferNext", barbar_t"Next Buffer")
nimap('<A-S-[>', cmd_t"BufferMovePrevious", barbar_t"Move Left")
nimap('<A-S-]>', cmd_t"BufferMoveNext", barbar_t"Move Right")
nimap('<A-1>', cmd_t"BufferGoto 1", barbar_t"Goto 1")
nimap('<A-2>', cmd_t"BufferGoto 2", barbar_t"Goto 2")
nimap('<A-3>', cmd_t"BufferGoto 3", barbar_t"Goto 3")
nimap('<A-4>', cmd_t"BufferGoto 4", barbar_t"Goto 4")
nimap('<A-5>', cmd_t"BufferGoto 5", barbar_t"Goto 5")
nimap('<A-6>', cmd_t"BufferGoto 6", barbar_t"Goto 6")
nimap('<A-7>', cmd_t"BufferGoto 7", barbar_t"Goto 7")
nimap('<A-8>', cmd_t"BufferGoto 8", barbar_t"Goto 8")
nimap('<A-9>', cmd_t"BufferGoto 9", barbar_t"Goto 9")
nimap('<A-0>', cmd_t"BufferLast", barbar_t"Goto Last Buffer")
nmap('<Leader>bp', cmd_t"BufferPin", barbar_t"Pin Buffer")
nimap('<C-q>', cmd_t"BufferClose", barbar_t"Close")
nimap('<C-S-q>', cmd_t"BufferClose!", barbar_t"Close Override")
nmap('<Leader><A-p>',   cmd_t"BufferPick", barbar_t"Pick Buffer")
nmap('<Leader><A-P>', cmd_t"BufferPickDelete", barbar_t"Pick Close Buffer")
nmap('<Leader>bb', cmd_t"BufferOrderByBufferNumber", barbar_t"Order By Number")
nmap('<Leader>bn', cmd_t"BufferOrderByName", barbar_t"Order By Name")
nmap('<Leader>bd', cmd_t"BufferOrderByDirectory", barbar_t"Order By Directory")
nmap('<Leader>bl', cmd_t"BufferOrderByLanguage", barbar_t"Order By Languge")
nmap('<Leader>bw', cmd_t"BufferOrderByWindowNumber", barbar_t"Order By Window Number")

local buffer_t = formatter_d_desc"Buffer"
nmap("<Leader>bq", cmd_t"bd", buffer_t"Close")
nmap("<Leader>bQ", cmd_t"bufdo bwipeout", buffer_t"Close All")

local oil = require('oil')
nmap('<Leader>e', oil.toggle_float, d_desc"Oil: Toggle File Manager")

local persistence = require("persistence")
local persistence_t = formatter_d_desc"Persistence"
nmap("<leader>poc", persistence.load, persistence_t"Load session on cwd")
nmap("<leader>pos", persistence.select, persistence_t"Select session")
nmap("<leader>pol", f_apply(persistence.load, {last = true}), persistence_t"Load last session")
nmap("<leader>pq", function() vim.cmd[[echo "Session stopped"]];persistence.stop() end, persistence_t"Stop session")
nmap("<leader>ps", function() vim.cmd[[echo "Session saved"]];persistence.save() end, persistence_t"Save session")


local harpoon = require('harpoon')
local harpoon_t = formatter_desc"Harpoon"
nmap("<leader>=", function() harpoon:list():add() end, harpoon_t"Add Buffer")
nimap("<A-S-0>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, harpoon_t"List Buffer")
nimap("<A-S-1>", function() harpoon:list():select(1) end)
nimap("<A-S-2>", function() harpoon:list():select(2) end)
nimap("<A-S-3>", function() harpoon:list():select(3) end)
nimap("<A-S-4>", function() harpoon:list():select(4) end)
nimap("<A-S-5>", function() harpoon:list():select(5) end)
nimap("<A-S-6>", function() harpoon:list():select(6) end)
nimap("<A-S-7>", function() harpoon:list():select(7) end)
nimap("<A-S-8>", function() harpoon:list():select(8) end)
nimap("<A-S-9>", function() harpoon:list():select(9) end)
nmap("<leader>[", function() harpoon:list():prev() end, harpoon_t"Previous Buffer")
nmap("<leader>]", function() harpoon:list():next() end, harpoon_t"Next Buffer")

local zenmode = require"zen-mode"
nmap(
    "<leader>z",
    f_apply(
	zenmode.toggle,
	{
	    window = {
		width = 1.0
	    }
	}),
    d_desc"Zenmode: Toggle"
)

require("icon-picker").setup({ disable_legacy_commands = true })
local opts = { noremap = true, silent = true }
map("n", "<Leader><Leader>i", cmd_t"IconPickerNormal", opts)
map("n", "<Leader><Leader>y", cmd_t"IconPickerYank", opts) --> Yank the selected icon into register
-- map("i", "<C-e>i", cmd_t"IconPickerInsert", opts)

local fterm = require"FTerm"
nmap("<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
map("t","<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
