#!/usr/bin/python3
import glob
import os
import sys
import subprocess as sbp
import shlex
import string

if len(sys.argv) > 1:
    wallpaper = f"{os.getenv("ROFI_INFO")}/{sys.argv[1]}"
    sbp.run(
        shlex.split(
            f'xwallpaper --tile "{wallpaper}"'
        )
    )
    sbp.run(
        shlex.split(
            f"ln -sf {wallpaper} /home/genes/.local/state/wallpaper/current_wallpaper"
        )
    )
    exit(0)
WALLPAPER_PATH = os.getenv("WALLPAPER_PATH")
if WALLPAPER_PATH == None or WALLPAPER_PATH == "" or not os.path.isdir(WALLPAPER_PATH):
    WALLPAPER_PATH = os.path.expanduser("~/Downloads")

rofi_t = string.Template(f"$text\0icon\x1f{WALLPAPER_PATH}/$icon\x1finfo\x1f{WALLPAPER_PATH}\n")
os.chdir(WALLPAPER_PATH)
filetypes = ["*.png", "*.jpg", "*.jpeg"]
files = []
for _type in filetypes:
    files.extend(glob.glob(_type))
else:
    files.sort()
for data in files:
    sys.stdout.write(
        rofi_t.substitute({
            "text": data,
            "icon": data
        })
    )
