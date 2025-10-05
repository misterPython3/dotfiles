local vim = vim
local M_functions = require("config.util.keymap_functions")
for key, value in pairs(M_functions) do
    rawset(_G, key, value)
end
nimap('<C-s>', cmd_t"write", { desc = 'Save File' })
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
nmap("<Leader>nb", cmd_t"enew", d_desc"New Buffer")

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
nmap('<Leader>bP', cmd_t"BufferPin", barbar_t"Pin Buffer")
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
nmap("<Leader>bq", cmd_t"bwipeout", buffer_t"Close")
nmap("<Leader>bQ", cmd_t"%bwipeout!", buffer_t"Close All")
nmap("<Leader>bo", cmd_t"%bwipeout! | e# | bwipeout!#", buffer_t"Buffer Only")

local oil = require('oil')
nmap('<Leader>e', oil.toggle_float, d_desc"Oil: Toggle Float")
nmap('<Leader>o', cmd_t"Oil", d_desc"Oil: Open Buffer")

local tree_api = require("nvim-tree.api")
local opt_t = formatter_opt_desc({noremap=true, silent=true, nowait=true},"NvimTree")
nmap('<Leader>E', tree_api.tree.toggle, opt_t"Toggle")

local persistence = require("persistence")
local persistence_t = formatter_d_desc"Persistence"
nmap("<leader>poc", persistence.load, persistence_t"Load session on cwd")
nmap("<leader>pos", persistence.select, persistence_t"Select session")
nmap("<leader>pol", f_apply(persistence.load, {last = true}), persistence_t"Load last session")
local stop_session_and_wipe = function ()
    persistence.stop()
    for _, lsp_client in ipairs(vim.lsp.get_clients()) do
	for buf_id, is_attached in pairs(lsp_client.attached_buffers) do
	    if is_attached then
	    	vim.lsp.buf_detach_client(buf_id, lsp_client.id)
	    end
	end
	lsp_client:stop()
    end
    vim.cmd[[%bwipeout! | echo "Session stopped" | Alpha | bd#]]
end
nmap("<leader>poq", function() coroutine.wrap(stop_session_and_wipe)() end, persistence_t"Stop session & wipeout")
nmap("<leader>poQ", function() persistence.save()coroutine.wrap(stop_session_and_wipe)() end, persistence_t"Save; Stop session & wipeout")
nmap("<leader>pq", function() vim.cmd[[echo "Session stopped"]];persistence.stop() end, persistence_t"Stop session")
nmap("<leader>ps", function() vim.cmd[[echo "Session saved"]];persistence.save() end, persistence_t"Save session")


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
opts = { noremap = true, silent = true }
map("n", "<Leader><Leader>i", cmd_t"IconPickerNormal", opts)
map("n", "<Leader><Leader>y", cmd_t"IconPickerYank", opts) --> Yank the selected icon into register
-- map("i", "<C-e>i", cmd_t"IconPickerInsert", opts)

local fterm = require"FTerm"
nmap("<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
map("t","<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
if vim.g.neovide then
    nimap('<A-{>', cmd_t"BufferMovePrevious", barbar_t"Move Left")
    nimap('<A-}>', cmd_t"BufferMoveNext", barbar_t"Move Right")
    nmap("<C-|>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
    map("t","<C-|>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
end
