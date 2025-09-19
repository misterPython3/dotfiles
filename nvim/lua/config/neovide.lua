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
    for key, value in pairs(neovide_config) do
    	vim.g[key] = value
    end
    vim.env.PATH =  vim.env.PATH..":/home/genes/Applications/yazi/target/release"
end
