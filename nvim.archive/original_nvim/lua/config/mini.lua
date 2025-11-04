local vim = vim
local path_package = vim.fn.stdpath('data') .. '/site'

local mini_plugins = {
	"echasnovski/mini.starter",
	'echasnovski/mini.statusline',
	'echasnovski/mini.tabline',
	'echasnovski/mini.files',
}


local MiniDeps = require('mini.deps')
MiniDeps.setup({
    path = {
	package = path_package
    }
})
local mini_add = MiniDeps.add
for index,mini_plugin in ipairs(mini_plugins) do
    mini_add(mini_plugin)
end


-- MiniStarter
local starter = require('mini.starter')

local telescope = require('telescope.builtin')

starter.setup({
    header = table.concat({
    '',
    ' ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ ',
    ' ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ ',
    ' ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ ',
    ' ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ ',
    ' ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ ',
    ' ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ ',
    ' ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ ',
    ' ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ ',
    ' ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ ',
    ' ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ ',
    ' ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ ',
    ' ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ ',
    ' ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ ',
    ' ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ ',
    ' ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ ',
    '',
    }, '\n'),
    evaluate_single = true,
    items = {
	starter.sections.telescope(),
    },
    content_hooks = {
	starter.gen_hook.adding_bullet(' ', true),
	starter.gen_hook.aligning('center','top'),
	starter.gen_hook.indexing('all', {'Builtin actions'}),
	starter.gen_hook.padding(0,8)
    },
    footer = ""
})

----


local section_macro = function()
    local recording = vim.fn.reg_recording()
    return (recording == "" and "" or ("Recording@"..recording))
end
-- MiniStatusLine
local statusline = require('mini.statusline')
statusline.setup({
    use_icons = vim.g.have_nerd_font,
    content = {
	active = function()
	    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	    local git           = MiniStatusline.section_git({ trunc_width = 40 })
	    local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
	    local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
	    local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
	    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
	    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
	    local location      = MiniStatusline.section_location({ trunc_width = 75 })
	    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
	    local macro		= section_macro()

	    return MiniStatusline.combine_groups({
	      { hl = mode_hl,                  strings = { mode, macro } },
	      { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics, lsp } },
	      '%<', -- Mark general truncate point
	      { hl = 'MiniStatuslineFilename', strings = { filename } },
	      '%=', -- End left alignment
	      { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
	      { hl = mode_hl,                  strings = { search, location } }
	    })
	end
    }
})

local minifiles = require('mini.files')
minifiles.setup{
      content = {
		filter = nil,
		prefix = nil,
		sort = nil,
      },

    mappings = {
	close       = 'q',
	go_in       = 'l',
	go_in_plus  = 'L',
	go_out      = 'h',
	go_out_plus = 'H',
	mark_goto   = "'",
	mark_set    = 'm',
	reset       = '<BS>',
	reveal_cwd  = '@',
	show_help   = 'g?',
	synchronize = '=',
	trim_left   = '<',
	trim_right  = '>',
      },

            options = {
		permanent_delete = true,
		use_as_default_explorer = true,
      },

            windows = {
		max_number = math.huge,
		preview = false,
		width_focus = 50,
		width_nofocus = 15,
		width_preview = 25,
      },
    }
----

-- MiniTabline
local tabline = require('mini.tabline')
tabline.setup({

})

----




