#!/usr/bin/bash

current_wallpaper_path=~/.config/i3/scripts/current_wallpaper
directory=$1
if [[ $directory == "" ]];then
	directory=~/Downloads/
fi
directory=$(realpath $directory)
images=$(ls -b $directory | grep -e ".*\.\(jpe\?\|pn\)g$")
count=$(echo $images | wc --words)

if [[ $count -lt 1 ]]; then
	echo "No images were found in "
	exit 0
else
	current_wallpaper=$(cat $current_wallpaper_path)
	getWallpaper(){
		wallpaper=$directory/$(ls -b $directory | sed -n $(shuf -i 1-$count -n 1)p)
	}
	getWallpaper
	while [[ ($current_wallpaper == $wallpaper) && ($count -ne 1) ]];do
		getWallpaper
		echo "$current_wallpaper_path $wallpaper";
	done
	echo $wallpaper >$current_wallpaper_path
	feh --bg-tile $wallpaper
fi
