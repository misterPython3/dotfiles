THEME_PATH=~/.config/alacritty/themes/themes ROFI_THEME_PATH=~/.config/rofi/themes POLYBAR_THEME_PATH=~/.config/polybar/colors OPENBOX_THEME_PATH=~/.local/share/themes rofi \
    -no-lazy-grab\
    -config "~/.config/rofi/custom/config.rasi"\
    -modi "Alacritty:~/.config/rofi/custom/alacritty/alacritty.py,Rofi:~/.config/rofi/custom/rofi/rofi.py,Polybar:~/.config/rofi/custom/polybar/polybar.py,Openbox:~/.config/rofi/custom/openbox/openbox.py"\
    -show Alacritty
