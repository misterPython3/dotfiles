#!/usr/bin/env bash

polybar-msg cmd quit
polybar statusbar | tee -a /tmp/polybar_statusbar.log & disown

echo "Bars launched..."
