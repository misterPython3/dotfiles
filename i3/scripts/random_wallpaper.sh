#!/usr/bin/bash

if [[ -d $1 ]];then
    WALLPAPER_DIRECTORY=$1
else
    WALLPAPER_DIRECTORY=~/Downloads
fi
if [[ -f $2 ]];then
    CURRENT_WALLPAPER_SYM=$2
else 
    CURRENT_WALLPAPER_SYM=~/.local/share/wallpaper/current_wallpaper
fi
CURWAL_SYM_DIR=$(dirname $CURRENT_WALLPAPER_SYM)
if [[ ! -d $CURWAL_SYM_DIR ]];then
    mkdir -p $CURWAL_SYM_DIR
fi

CURRENT_WALLPAPER=$(readlink -e "$CURRENT_WALLPAPER_SYM")
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -maxdepth 1 -type f -regex ".*\.\(pn\|jpe?\)g$" | sed "\%${CURRENT_WALLPAPER:-\\n}%d" | shuf | head -n 1)
ln -sf "$WALLPAPER" "$CURRENT_WALLPAPER_SYM"
xwallpaper --tile "$WALLPAPER"
