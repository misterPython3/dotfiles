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
	    default=current_path,
	    completion = "file_in_path",
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
			if input ~= nil and string.match(input,"^[Yy][Ee]+[Ss]?") then
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

local function open_file()
    local current_directory = vim.fn.expand("%:h:p")
    if current_directory == "" or current_directory == nil then
	current_directory = vim.fn.getcwd()
    end
    current_directory = current_directory .. (string.match(current_directory, ".*/$") and "" or "/")
    vim.ui.input(
	{
	    prompt="Open File",
	    default=current_directory,
	    completion = "file",
	},
	function(path)
	    local isWritable = vim.fn.filewritable(path)
	    local message
	    if path == nil then
		return
	    elseif path == "" then
		message = "Unable to edit file."
	    elseif isWritable == 2 or string.match(path, ".*/$") or vim.fn.isdirectory(path) == 1 then
		message = "Unable to edit a directory."
	    elseif vim.fn.expand("%") == string.gsub(vim.fn.expand(path),"/*$", "") then
		message = "Already editing file."
	    elseif isWritable == 1 then
		message = "Opening file: "..path
		vim.cmd.edit(path)
	    else
		message = "File '"..path.."' does not exist."
	    end
	    print(path)
	    vim.notify(message, vim.log.levels.INFO)
	end
    )
end

local function toggle_colorscheme()
    vim.o.background = vim.o.background == "light" and "dark" or "light"
    vim.notify("Colorscheme: "..vim.o.background, vim.log.levels.INFO)
end

-- base rebinds
local base_opt = {noremap=true,nowait=true,silent=false}
local base_t = create_optgroup("Base", base_opt)

-- temporary rebind
bindkey({"n","i","v"},"`",";", base_opt)
bindkey({"n","i","v"},";","`", base_opt)
bindkey({"n","i","v"},"~",":", base_opt)
bindkey({"n","i","v"},":","~", base_opt)
--
bindkey({"n","i","v"},"<C-c>", "<ESC>", base_opt)
bindkey({"n","v"},"J","gj",base_t"Wrap Jump Down")
bindkey({"n","v"},"K","gk",base_t"Wrap Jump Up")
bindkey({"n","v"},"gj","J",base_t"Join Line")
bindkey({"n","v"},"gk","K",base_t"Lookup")
nmap("<Leader>v","<C-q>", base_opt)
imap("<S-CR>","<ESC>o", base_opt)
imap("<C-S-CR>","<ESC>O", base_opt)
--
tmap("<C-w>","<C-\\><C-n>",base_opt)
--
nimap("<C-s>", cmd_t"write", base_t"Save")
nimap(
    "<C-S-s>",
    save_as,
    base_t"Save"
)
bindkey({"n","v"}, "<C-\\>", ":", base_t"Enter Command-Mode")
imap("<C-\\>", "<ESC>:", base_t"Enter Command-Mode")
cmap("<C-\\>", "<ESC>", base_t"Leave Command-Mode")

-- base cursor binds
local cursor_t = create_optgroup("Cursor", base_opt)
nimap("<M-k>", "<Up>", cursor_t"Move Up")
nimap("<M-l>", "<Right>", cursor_t"Move Right")
nimap("<M-j>", "<Down>", cursor_t"Move Down")
nimap("<M-h>", "<Left>", cursor_t"Move Left")

-- base new bindings
nmap("<Leader>E", open_file, base_t"Open File")
nmap("<Leader>nh", cmd_t"nohl", base_t"Turn off search highlight")
nmap("<Leader>nn", cmd_t"enew", base_t"Newfile")
nmap("<Leader>ob", cmd_t"silent!%bd | Alpha", base_t"Clear Buffers & Goto Alpha")
nmap("<Leader>aa", cmd_t"silent argadd % | argdedupe", base_t"Add buffer to args")
nmap("<Leader>ad", cmd_t"silent! argdelete", base_t"Delete buffer from args")
nmap("<C-1>", cmd_t"silent! 1argument", base_t"Goto 1st Arg")
nmap("<C-2>", cmd_t"silent! 2argument", base_t"Goto 2nd Arg")
nmap("<C-3>", cmd_t"silent! 3argument", base_t"Goto 3rd Arg")
nmap("<C-4>", cmd_t"silent! 4argument", base_t"Goto 4th Arg")
nmap("<C-5>", cmd_t"silent! 5argument", base_t"Goto 5th Arg")
nmap("<C-6>", cmd_t"silent! 6argument", base_t"Goto 6th Arg")
nmap("<C-7>", cmd_t"silent! 7argument", base_t"Goto 7th Arg")
nmap("<C-8>", cmd_t"silent! 8argument", base_t"Goto 8th Arg")
nmap("<C-9>", cmd_t"silent! 9argument", base_t"Goto 9th Arg")
nmap("<Leader>tc", toggle_colorscheme, base_t"Toggle Colorscheme Mode")
nmap("<Leader>Md", cmd_t"delmarks!", add_opt_desc("Delete All Marks", base_opt))

-- WhichKey bind
nmap("<leader>w", cmd_t"WhichKey", add_opt_desc("WhichKey: show binds", base_opt))
-- floating window / menu plugin bindings
nmap("<leader>d", cmd_t"alpha", add_opt_desc("alpha: toggle", base_opt))
nmap("<Leader>m", cmd_t"Mason", add_opt_desc("Mason: Open", base_opt))
nmap("<Leader>L", cmd_t"Lazy", add_opt_desc("Lazy: Open", base_opt))
nmap("<Leader>e", cmd_t"Oil --float", add_opt_desc("Oil: Toggle Float",base_opt))

-- toggleterm bind
local term_t = create_optgroup("ToggleTerm", base_opt)
bindkey({"t","i","n"}, "<C-S-\\>", cmd_t"ToggleTerm direction=float", term_t"Toggle")

-- plugin bindings
-- fzf bindings
local fzf_t = create_optgroup("FzfLua", base_opt)
local fzf_bind = create_keygroup("n", "<Leader>f")
local function fzf_lua_files()
    require("fzf-lua").files({
	winopts = {
	    width = 0.64,
	    height = 0.6,
	    row = 0.5,
	    col = 0.5,
	    preview = {
		hidden = true
	    },
	},
	cwd = vim.fn.expand("%:h")
    })
end
nmap("<Leader>F",cmd_t"FzfLua",fzf_t"Builtin")
fzf_bind("F",cmd_t"FzfLua",fzf_t"Builtin")
fzf_bind("a",cmd_t"FzfLua args",fzf_t"Args")
nmap("<Leader>al", cmd_t"silent! FzfLua args", base_t"List Args")
fzf_bind("A",cmd_t"FzfLua autocmds",fzf_t"Autocmd")
fzf_bind("b", cmd_t"FzfLua buffers", fzf_t"Buffers")
fzf_bind("c", cmd_t"FzfLua colorschemes", fzf_t"Select Colorscheme")
fzf_bind("C", cmd_t"FzfLua commands", fzf_t"Commands")
fzf_bind("d", cmd_t"FzfLua diagnostics_document", fzf_t"Document Diagnostics")
fzf_bind("D", cmd_t"FzfLua diagnostics_workspace", fzf_t"Workspace Diagnostics")
fzf_bind("f", fzf_lua_files, fzf_t"Files")
fzf_bind("g", cmd_t"FzfLua grep", fzf_t"Grep")
fzf_bind("h", cmd_t"FzfLua highlights", fzf_t"Highlights")
fzf_bind("HC", cmd_t"FzfLua command_history", fzf_t"Commands History")
fzf_bind("Hs", cmd_t"FzfLua search_history", fzf_t"Search History")
fzf_bind("j", cmd_t"FzfLua jumps", fzf_t"Jumps")
fzf_bind("k", cmd_t"FzfLua keymaps", fzf_t"Keymaps")
fzf_bind("m", cmd_t"FzfLua marks", fzf_t"Marks")
fzf_bind("M", cmd_t"FzfLua manpages", fzf_t"Manpages")
fzf_bind("o", cmd_t"FzfLua oldfiles", fzf_t"Oldfiles")
fzf_bind("r", cmd_t"FzfLua registers", fzf_t"Registers")
fzf_bind("R", cmd_t"FzfLua resume", fzf_t"Resume")
fzf_bind("tf", cmd_t"FzfLua filetypes", fzf_t"Filetypes")
fzf_bind("tt", cmd_t"FzfLua tabs", fzf_t"Filetypes")
fzf_bind("T", cmd_t"FzfLua treesitter", fzf_t"Treesitter")

-- barbar bindings
local barbar_bind = create_keygroup("n","<Leader>b")
local barbar_t = create_optgroup("BarBar",base_opt)
nimap('<M-[>', cmd_t'BufferPrevious', base_t"Previous")
nimap('<M-]>', cmd_t'BufferNext', base_t"Next")
nimap('<C-S-Tab>', cmd_t'BufferPrevious', base_t"Previous")
nimap('<C-Tab>', cmd_t'BufferNext', base_t"Next Buffer")
nimap('<M-S-[>', cmd_t'BufferMovePrevious', base_t"Move Left")
nimap('<M-S-]>', cmd_t'BufferMoveNext', base_t"Move Right")
nmap('<M-1>', cmd_t'BufferGoto 1', base_t"Goto Buffer 1")
nmap('<M-2>', cmd_t'BufferGoto 2', base_t"Goto Buffer 2")
nmap('<M-3>', cmd_t'BufferGoto 3', base_t"Goto Buffer 3")
nmap('<M-4>', cmd_t'BufferGoto 4', base_t"Goto Buffer 4")
nmap('<M-5>', cmd_t'BufferGoto 5', base_t"Goto Buffer 5")
nmap('<M-6>', cmd_t'BufferGoto 6', base_t"Goto Buffer 6")
nmap('<M-7>', cmd_t'BufferGoto 7', base_t"Goto Buffer 7")
nmap('<M-8>', cmd_t'BufferGoto 8', base_t"Goto Buffer 8")
nmap('<M-9>', cmd_t'BufferGoto 9', base_t"Goto Buffer 9")
nmap('<M-0>', cmd_t'BufferLast', base_t"Goto Last Buffer")
-- barbar open/close/pin buffer
nmap('<C-q>', cmd_t'BufferClose', base_t"Close Buffer")
nmap('<C-S-q>', cmd_t'BufferClose!', base_t"Force Close Buffer")
barbar_bind('p', cmd_t'BufferPick', barbar_t"Pick")
barbar_bind('P', cmd_t'BufferPin', barbar_t"Pin")
barbar_bind('d', cmd_t'BufferPickDelete', barbar_t"Pick Delete")
-- barbar sort
barbar_bind('ob', cmd_t'BufferOrderByBufferNumber', barbar_t"Order By Buffer Name")
barbar_bind('on', cmd_t'BufferOrderByName', barbar_t"Order By Name")
barbar_bind('od', cmd_t'BufferOrderByDirectory', barbar_t"Order By Directory")
barbar_bind('ol', cmd_t'BufferOrderByLanguage', barbar_t"Order By Language")
barbar_bind('ow', cmd_t'BufferOrderByWindowNumber', barbar_t"Order By Window Number")

-- autosession binds
local session_bind = create_keygroup("n","<Leader>s")
local session_t = create_optgroup("AutoSession", base_opt)
session_bind("s", cmd_t"AutoSession save", session_t"Save")
session_bind("/", cmd_t"AutoSession search", session_t"Search")
session_bind("t", cmd_t"AutoSession toggle", session_t"Toggle Autosave")
session_bind("l", cmd_t"AutoSession restore", session_t"Restore Last Session")
session_bind("q", cmd_t"exec('AutoSession save') | silent!%bd | Alpha", session_t"Save & Goto Dashboard")

-- lsp binds
local lsp_bind = create_keygroup("n","<Leader>l")
local lsp_t = create_optgroup("Lsp", base_opt)
lsp_bind("S", cmd_t"LspStart", lsp_t"Start")
lsp_bind("s", cmd_t"LspStop", lsp_t"Stop")
lsp_bind("i", cmd_t"LspInfo", lsp_t"Info")
lsp_bind("I", cmd_t"LspInstall", lsp_t"Install")
lsp_bind("l", cmd_t"LspLog", lsp_t"Log")
lsp_bind("r", cmd_t"LspRestart", lsp_t"Restart")

-- treesitter binds
local treesitter_bind = create_keygroup("n","<Leader>T")
local treesitter_t = create_optgroup("Treesitter", base_opt)
treesitter_bind("ti", cmd_t"TSToggle indent", treesitter_t"Toggle Indent")
treesitter_bind("th", cmd_t"TSToggle highlight",treesitter_t"Toggle Highlight")
treesitter_bind("tI", cmd_t"TSToggle incremental_selection",treesitter_t"Toggle Incremental Selection")
treesitter_bind("ei", cmd_t"TSEnable indent", treesitter_t"Enable Indent")
treesitter_bind("eh", cmd_t"TSEnable highlight",treesitter_t"Enable Highlight")
treesitter_bind("eI", cmd_t"TSEnable incremental_selection",treesitter_t"Enable Incremental Selection")
treesitter_bind("di", cmd_t"TSDisable indent", treesitter_t"Disable Indent")
treesitter_bind("dh", cmd_t"TSDisable highlight",treesitter_t"Disable Highlight")
treesitter_bind("dI", cmd_t"TSDisable incremental_selection",treesitter_t"Disable Incremental Selection")

-- colorizer binds
local colorizer_bind = create_keygroup("n","<Leader>c")
local colorizer_t = create_optgroup("Colorizer", base_opt)
colorizer_bind("t", cmd_t"ColorizerToggle", colorizer_t"Toggle")
colorizer_bind("a", cmd_t"ColorizerAttachToBuffer", colorizer_t"Attach")
colorizer_bind("d", cmd_t"ColorizerDetachFromBuffer", colorizer_t"Detach")
colorizer_bind("r", cmd_t"ColorizerReloadAllBuffers", colorizer_t"Reload")

-- aerial binds
local aerial_t = create_optgroup("Aerial", base_opt)
nmap("<Leader>A",cmd_t"AerialToggle right", aerial_t"Toggle")
nmap("<Leader>tal", cmd_t"AerialToggle left", aerial_t"Toggle")
nmap("<Leader>tar", cmd_t"AerialToggle right", aerial_t"Toggle")

-- nerdy binds
local nerdy_t = create_optgroup("Nerdy", base_opt)
nmap("<Leader>ii",cmd_t"Nerdy", nerdy_t"")
nmap("<Leader>il",cmd_t"Nerdy list", nerdy_t"List")
nmap("<Leader>ir",cmd_t"Nerdy recent", nerdy_t"Recent")

