local base_func = require("config.base.func")
local keys_func = require("config.keymaps.func")
local vim = vim

base_func.push(_G, keys_func)

local function save_as()
    local current_path = vim.fn.expand("%")
    if current_path == "" or current_path == nil then
	current_path = vim.fn.getcwd()
    end
    vim.ui.input(
	{
	    prompt="Save file as",
	    default=current_path
	},
	function(filename)
	    local isWritable = vim.fn.filewritable(filename)
	    local message
	    if filename == nil or filename == "" or isWritable == 2 then
		message = "File not saved."
	    elseif filename == current_path and isWritable == 1 then
		vim.ui.input(
		    {
			prompt="Overwrite file? (y/N)",
		    },
		    function(input)
			if input ~= nil and string.match(input,"^[Yy]") then
			    vim.cmd.write()
			    message = string.format("File overwritten: %s", filename)
			else
			    message = "Overwrite cancelled."
			end
		    end
		)
	    elseif isWritable == 0 then
		vim.cmd.write(filename)
		message = string.format("File saved: %s", filename)
	    end
	    vim.notify(message)
	end
    )
end
local base_opt = {noremap=true,nowait=true,silent=false}
local base_t = create_optgroup("BaseBind", base_opt)
tmap("<C-w>","<C-\\><C-n>",base_opt)
bindkey({"n","i","v"},"`",";", base_opt)
bindkey({"n","i","v"},";","`", base_opt)
bindkey({"n","i","v"},"~",":", base_opt)
bindkey({"n","i","v"},":","~", base_opt)
nimap("<C-c>", "<ESC>", base_opt)
nimap("<C-s>", cmd_t"write", base_t"Save")
nimap(
    "<C-S-s>",
    save_as,
    base_t"Save"
)
bindkey({"n","v"}, "<C-\\>", ":", base_t"Enter Command-Mode")
imap("<C-\\>", "<ESC>:", base_t"Enter Command-Mode")
cmap("<C-\\>", "<ESC>", base_t"Leave Command-Mode")
nmap("<Leader>nh", cmd_t"nohl", base_t"Turn off search highlight")
nmap("<Leader>nn", cmd_t"enew", base_t"Newfile")
nmap("<Leader>ob", cmd_t"silent %bd | Alpha", base_t"Clear Buffers & Goto Alpha")
nmap("<Leader>a", cmd_t"Alpha", add_opt_desc("Alpha: Toggle", base_opt))
nmap("<Leader>e", cmd_t"Oil --float", add_opt_desc("Oil: Toggle Float",base_opt))

local cursor_t = create_optgroup("Cursor", base_opt)
nimap("<M-k>", "<Up>", cursor_t"Move Up")
nimap("<M-l>", "<Right>", cursor_t"Move Right")
nimap("<M-j>", "<Down>", cursor_t"Move Down")
nimap("<M-h>", "<Left>", cursor_t"Move Left")

local fzf_t = create_optgroup("FzfLua", base_opt)
local fzf_bind = create_keygroup("n", "<Leader>f")
nmap("<Leader>F",cmd_t"FzfLua",fzf_t"Builtin")
fzf_bind("F",cmd_t"FzfLua",fzf_t"Builtin")
fzf_bind("a",cmd_t"FzfLua autocmds",fzf_t"Autocmd")
fzf_bind("b", cmd_t"FzfLua buffers", fzf_t"Buffers")
fzf_bind("c", cmd_t"FzfLua colorschemes", fzf_t"Select Colorscheme")
fzf_bind("C", cmd_t"FzfLua commands", fzf_t"Commands")
fzf_bind("d", cmd_t"FzfLua diagnostics_document", fzf_t"Document Diagnostics")
fzf_bind("D", cmd_t"FzfLua diagnostics_workspace", fzf_t"Workspace Diagnostics")
fzf_bind("f", cmd_t"FzfLua files", fzf_t"Files")
fzf_bind("g", cmd_t"FzfLua grep", fzf_t"Grep")
fzf_bind("h", cmd_t"FzfLua highlights", fzf_t"Highlights")
fzf_bind("HC", cmd_t"FzfLua command_history", fzf_t"Commands History")
fzf_bind("Hs", cmd_t"FzfLua search_history", fzf_t"Search History")
fzf_bind("j", cmd_t"FzfLua jumps", fzf_t"Jumps")
fzf_bind("k", cmd_t"FzfLua keymaps", fzf_t"Keymaps")
fzf_bind("m", cmd_t"FzfLua marks", fzf_t"Marks")
fzf_bind("M", cmd_t"FzfLua manpages", fzf_t"Manpages")
fzf_bind("o", cmd_t"FzfLua oldfiles", fzf_t"Oldfiles")
fzf_bind("t", cmd_t"FzfLua filetypes", fzf_t"Filetypes")


local barbar_bind = create_keygroup("n","<Leader>b")
local barbar_t = create_optgroup("BarBar",base_opt)
nimap('<M-[>', cmd_t'BufferPrevious', base_opt)
nimap('<M-]>', cmd_t'BufferNext', base_opt)
nimap('<M-S-[>', cmd_t'BufferMovePrevious', base_opt)
nimap('<M-S-]>', cmd_t'BufferMoveNext', base_opt)
nmap('<M-1>', cmd_t'BufferGoto 1', base_opt)
nmap('<M-2>', cmd_t'BufferGoto 2', base_opt)
nmap('<M-3>', cmd_t'BufferGoto 3', base_opt)
nmap('<M-4>', cmd_t'BufferGoto 4', base_opt)
nmap('<M-5>', cmd_t'BufferGoto 5', base_opt)
nmap('<M-6>', cmd_t'BufferGoto 6', base_opt)
nmap('<M-7>', cmd_t'BufferGoto 7', base_opt)
nmap('<M-8>', cmd_t'BufferGoto 8', base_opt)
nmap('<M-9>', cmd_t'BufferGoto 9', base_opt)
nmap('<M-0>', cmd_t'BufferLast', base_opt)

nmap('<C-q>', cmd_t'BufferClose', base_opt)
nmap('<C-S-q>', cmd_t'BufferClose!', base_opt)

barbar_bind('p', cmd_t'BufferPick', barbar_t"Pick")
barbar_bind('P', cmd_t'BufferPin', barbar_t"Pin")
barbar_bind('d', cmd_t'BufferPickDelete', barbar_t"Pick Delete")
barbar_bind('ob', cmd_t'BufferOrderByBufferNumber', barbar_t"Order By Buffer Name")
barbar_bind('on', cmd_t'BufferOrderByName', barbar_t"Order By Name")
barbar_bind('od', cmd_t'BufferOrderByDirectory', barbar_t"Order By Directory")
barbar_bind('ol', cmd_t'BufferOrderByLanguage', barbar_t"Order By Language")
barbar_bind('ow', cmd_t'BufferOrderByWindowNumber', barbar_t"Order By Window Number")

local session_bind = create_keygroup("n","<Leader>s")
local session_t = create_optgroup("AutoSession", base_opt)
session_bind("s", cmd_t"AutoSession save", session_t"Save")
session_bind("/", cmd_t"AutoSession search", session_t"Search")
session_bind("t", cmd_t"AutoSession toggle", session_t"Toggle Autosave")
session_bind("l", cmd_t"AutoSession restore", session_t"Restore Last Session")
session_bind("q", cmd_t"exec('AutoSession save') | silent %bd | Alpha", session_t"Save & Goto Dashboard")

local lsp_bind = create_keygroup("n","<Leader>l")
local lsp_t = create_optgroup("Lsp", base_opt)
lsp_bind("S", cmd_t"LspStart", lsp_t"Start")
lsp_bind("s", cmd_t"LspStop", lsp_t"Stop")
lsp_bind("i", cmd_t"LspInfo", lsp_t"Info")
lsp_bind("I", cmd_t"LspInstall", lsp_t"Install")
lsp_bind("l", cmd_t"LspLog", lsp_t"Log")
lsp_bind("r", cmd_t"LspRestart", lsp_t"Restart")

nmap("m", cmd_t"Mason", add_opt_desc("Mason: Open", base_opt))

local nerdy_t = create_optgroup("Nerdy", base_opt)
nmap("<Leader>ii",cmd_t"Nerdy", nerdy_t"")
nmap("<Leader>il",cmd_t"Nerdy list", nerdy_t"List")
nmap("<Leader>ir",cmd_t"Nerdy recent", nerdy_t"Recent")

local term_t = create_optgroup("ToggleTerm", base_opt)
bindkey({"t","i","n"}, "<C-S-\\>", cmd_t"ToggleTerm", term_t"Toggle")
