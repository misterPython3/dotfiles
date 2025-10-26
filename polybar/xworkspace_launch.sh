#!/usr/bin/env bash

polybar-msg cmd quit
polybar statusbar --config=~/.config/polybar/xworkspace_config.ini 2>&1 | tee -a /tmp/polybar_statusbar.log & disown

echo "Bars launched..."
