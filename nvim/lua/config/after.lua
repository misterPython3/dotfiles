local base_func = require("config.base.func")
local keymaps_func = require("config.keymaps.func")
local vim = vim
if vim.g.neovide then
    local neovide_config = {
	neovide_scroll_animation_far_lines = 0,

	neovide_cursor_animation_length = 0.05,
	neovide_cursor_smooth_blink = true,
	neovide_cursor_short_animation_length = 0.01,

	neovide_cursor_vfx_mode = "sonicboom",
	neovide_cursor_vfx_opacity = 125.0,
	neovide_cursor_trail_size = 0.5,

	neovide_position_animation_length = 0.1,

    }
	base_func.extend(vim.g, neovide_config)

    vim.env.PATH =  vim.env.PATH..":/home/genes/Applications/yazi/target/release"

	local base_t = keymaps_func.create_optgroup("Base",{noremap=true,silent=false,nowait=true})
	keymaps_func.nimap('<M-{>', cmd_t'BufferMovePrevious', base_t"Move Left")
	keymaps_func.nimap('<M-}>', cmd_t'BufferMoveNext', base_t"Move Right")
end
vim.cmd.colorscheme("dawnfox")
