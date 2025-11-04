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
for key, value in pairs(neovide_config) do
    vim.g[key] = value
end
vim.env.PATH =  vim.env.PATH..":/home/genes/Applications/yazi/target/release"


local keymap_f = require("config.util.keymap_functions")
local barbar_t = keymap_f.formatter_opt_desc(barbar_opts, "BarBar")
local fterm = require"FTerm"
keymap_f.nimap('<A-{>', keymap_f.cmd_t"BufferMovePrevious", barbar_t"Move Left")
keymap_f.nimap('<A-}>', keymap_f.cmd_t"BufferMoveNext", barbar_t"Move Right")
keymap_f.nmap("<C-|>", fterm.toggle, keymap_f.d_desc"FTerm: Toggle Terminal")
keymap_f.map("t","<C-|>", fterm.toggle, keymap_f.d_desc"FTerm: Toggle Terminal")
