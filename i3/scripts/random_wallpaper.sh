#!/usr/bin/bash

current_wallpaper_path=~/.config/i3/scripts/current_wallpaper
directory=$1
if [[ ! -d $directory ]];then
    if [[ -a $directory ]];then
	output="'$directory' is not a directory"
    else
	output="'$directory' does not exist"
    fi
    echo "$output, will use current directory"
    directory=$(realpath ./)
fi

images=$(ls -1 $directory | grep -e ".*\.\(jpe\?\|pn\)g$")
count=$(printf "$images" | wc --lines)
if [[ $count -le 0 ]];then
    echo "No image found in this directory."
    exit 1
fi
current_wallpaper=$(cat $current_wallpaper_path)

if [[ -f $current_wallpaper_path && $current_wallpaper =~ $directory && $count -gt 1 ]];then
    filename=$(printf "$current_wallpaper" | sed s/.*\\/// )
    images=$(printf "$images" | sed "/^$filename$/d")
    count=$((count - 1))
fi
wallpaper=$directory/$(printf "$images" | sed -n "$(shuf -i 1-$count -n 1)p")

echo "$wallpaper" | tee -p $current_wallpaper_path 1>/dev/null 2>&1
xwallpaper --tile "$wallpaper"
