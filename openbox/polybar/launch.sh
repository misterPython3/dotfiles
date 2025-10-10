#!/usr/bin/bash

polybar-msg cmd quit
polybar statusbar --log=/tmp/openbox_polybar.log --config=~/.config/polybar/config.ini 2>&1 & disown
