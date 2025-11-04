local vim = vim
-- vim custom base keymap
local map = vim.keymap.set

local DEFAULT_OPTION = {
    silent = true,
    nowait = true,
    noremap = false,
    desc = "No Description"
}

local function f_wrapper(func, ...)
    local wrapper_arg = ...
    return function()
	return func(wrapper_arg)
    end
end
-- @param new_table table
-- @param default table
local function default_table(new_table,default)
    if new_table == nil then
	return default or {}
    end
    if default == nil then
    	return new_table
    end
    local temp_table = {}
    for key, value in pairs(new_table) do
    	temp_table[key] = value
    end
    setmetatable(new_table, {
	__newindex = function(_,k,v) temp_table[k] = v end
    })
    for key, value in pairs(default) do
	new_table[key] = value
    end
    setmetatable(new_table,{})
    return temp_table
end
local d_opt = function (opt)
    return default_table(opt, DEFAULT_OPTION)
end
local d_desc = function(desc)
    if desc == nil then
    	return DEFAULT_OPTION
    end
    return d_opt{desc=desc}
end

local map = vim.keymap.set
local metamap = function(mode, default_opt)
    return function(lhs,rhs, opt)
	return map(mode,lhs,rhs, default_table(opt,default_opt))
    end
end
local default_opt_metamap = function(mode) return metamap(mode, DEFAULT_OPTION) end
local nmap = default_opt_metamap("n")
local imap = default_opt_metamap("i")
local nimap = default_opt_metamap({"n","i"})

local formatter = function(title) return function(desc) return title..": "..desc end end

local fzf_f = formatter"FzfLua"
nmap("<Leader>fF","<Cmd>FzfLua<CR>",d_desc(fzf_f"Builtin"))
nmap("<Leader>fb","<Cmd>FzfLua buffers<CR>",d_desc(fzf_f"Buffers"))
nmap("<Leader>fm","<Cmd>FzfLua menus<CR>",d_desc(fzf_f"Menus"))
nmap("<Leader>ff","<Cmd>FzfLua files<CR>",d_desc(fzf_f"Files"))
nmap("<Leader>fo","<Cmd>FzfLua oldfiles<CR>",d_desc(fzf_f"Oldfiles"))
nmap("<Leader>fco","<Cmd>FzfLua colorschemes<CR>",d_desc(fzf_f"Colorscheme"))
nmap("<Leader>fCc","<Cmd>FzfLua commands<CR>",d_desc(fzf_f"Commands"))
nmap("<Leader>fCh","<Cmd>FzfLua command_history<CR>",d_desc(fzf_f"Command History"))
nmap("<Leader>fac","<Cmd>FzfLua awesome_colorschemes<CR>",d_desc(fzf_f"Awesome Colorscheme"))
nmap("<Leader>fh","<Cmd>FzfLua highlights<CR>",d_desc(fzf_f"Highlights"))
nmap("<Leader>fsh","<Cmd>FzfLua search_history<CR>",d_desc(fzf_f"Search History"))

local barbar_opts = { noremap = true, silent = true }
local barbar_t = formatter"Barbar"
local buf_desc = function(desc) return default_table({desc=barbar_t(desc)},barbar_opts) end
nimap('<A-[>', '<Cmd>BufferPrevious<CR>', buf_desc"Previous Buffer")
nimap('<A-]>', '<Cmd>BufferNext<CR>', buf_desc"Next Buffer")
nimap('<A-S-[>', '<Cmd>BufferMovePrevious<CR>', buf_desc"Move Left")
nimap('<A-S-]>', '<Cmd>BufferMoveNext<CR>', buf_desc"Move Right")
nmap('<A-1>', '<Cmd>BufferGoto 1<CR>', buf_desc"Goto 1")
nmap('<A-2>', '<Cmd>BufferGoto 2<CR>', buf_desc"Goto 2")
nmap('<A-3>', '<Cmd>BufferGoto 3<CR>', buf_desc"Goto 3")
nmap('<A-4>', '<Cmd>BufferGoto 4<CR>', buf_desc"Goto 4")
nmap('<A-5>', '<Cmd>BufferGoto 5<CR>', buf_desc"Goto 5")
nmap('<A-6>', '<Cmd>BufferGoto 6<CR>', buf_desc"Goto 6")
nmap('<A-7>', '<Cmd>BufferGoto 7<CR>', buf_desc"Goto 7")
nmap('<A-8>', '<Cmd>BufferGoto 8<CR>', buf_desc"Goto 8")
nmap('<A-9>', '<Cmd>BufferGoto 9<CR>', buf_desc"Goto 9")
nmap('<A-0>', '<Cmd>BufferLast<CR>', buf_desc"Goto Last Buffer")
nmap('<Leader>bp', '<Cmd>BufferPin<CR>', buf_desc"Pin Buffer")
nimap('<C-q>', '<Cmd>BufferClose<CR>', buf_desc"Close")
nimap('<C-S-q>', '<Cmd>BufferClose!<CR>', buf_desc"Close Override")
nmap('<Leader><A-p>',   '<Cmd>BufferPick<CR>', buf_desc"Pick Buffer")
nmap('<Leader><A-P>', '<Cmd>BufferPickDelete<CR>', buf_desc"Pick Close Buffer")
nmap('<Leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', buf_desc"Order By Number")
nmap('<Leader>bn', '<Cmd>BufferOrderByName<CR>', buf_desc"Order By Name")
nmap('<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>', buf_desc"Order By Directory")
nmap('<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>', buf_desc"Order By Languge")
nmap('<Leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', buf_desc"Order By Window Number")

local oil = require('oil')
nmap('<Leader>e',f_wrapper(oil.toggle_float,"."), d_desc"Oil: Toggle File Manager")

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
imap("<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : (v:lua.check_back_space()) ? "<TAB>" : coc#refresh()', opts)
imap("<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
imap("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
imap("<c-f>", "<Plug>(coc-snippets-expand-jump)")
imap("<c-space>", "coc#refresh()", {silent = true, expr = true})
local coc_t = formatter"Coc"
nmap("<leader>cr", "<Cmd>CocRestart<CR>", d_desc(coc_t"Restart"))
nmap("<leader>co", "<Cmd>CocOutline<CR>", d_desc(coc_t"Outline"))
nmap("<leader>cd", "<Cmd>CocDiagnostics<CR>", d_desc(coc_t"Diagnostics"))
nmap("<leader>cr", "<Cmd>CocLocalConfig<CR>", d_desc(coc_t"Local Config"))
nmap("<leader>cc", "<Cmd>CocConfig<CR>", d_desc(coc_t"Config"))


local persistence = require("persistence")
local persistence_t = formatter"Persistence"
-- load the session for the current directory
nmap("<leader>poc", f_wrapper(persistence.load), d_desc(persistence_t"Load session on cwd"))
-- select a session to load
nmap("<leader>pos", f_wrapper(persistence.select), d_desc(persistence_t"Select session"))
-- load the last session
nmap("<leader>pol", f_wrapper(persistence.load,{last = true}),d_desc(persistence_t"Load last session"))
-- stop Persistence => session won't be saved on exit
nmap("<leader>pq", f_wrapper(persistence.stop), d_desc(persistence_t"Stop session"))
nmap("<leader>ps", f_wrapper(persistence.save), d_desc(persistence_t"Save session"))

local zenmode = require"zen-mode"
nmap(
    "<leader>z",
    f_wrapper(
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
map("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
map("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
-- map("i", "<C-e>i", "<cmd>IconPickerInsert<cr>", opts)



nimap("<C-j>","<C-e>",d_desc"Scroll: Down")
nimap("<C-k>","<C-y>",d_desc"Scroll: Up")
nimap("<C-w>Q","<Cmd>q!<CR>",d_desc"Window: Close Override")
map({'n', 'i'},'<C-s>', function() vim.api.nvim_command('write') end, { desc = 'Save File' })

nimap(
    "<C-\\>",
    "<Esc>:",
    d_opt{silent = false, desc="Open Command Line"}
)

local fterm = require"FTerm"
nmap("<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")
map("t","<C-S-\\>", fterm.toggle, d_desc"FTerm: Toggle Terminal")

nmap("<Leader>a","<Cmd>Alpha<CR>",d_desc"Alpha: Open Dashboard")

nmap('<Leader>m',"<Cmd>messages<CR>", d_desc"Open messages")
nimap("<C-w>","<C-w>", {silent = false, noremap = false})
nmap("<C-w>[", "<C-w><", {desc = "Decrease Window Width", noremap = false})
nmap("<C-w>]", "<C-w>>", {desc = "Increase Window Width", noremap = false})
