#!/usr/bin/python3
import glob
import os
import sys
import subprocess as sbp
import shlex
import string

WALLPAPER_PATH = os.getenv("WALLPAPER_PATH")
if WALLPAPER_PATH is None or WALLPAPER_PATH == "" or not os.path.isdir(WALLPAPER_PATH):
    WALLPAPER_PATH = "~/Downloads"
WALLPAPER_PATH = os.path.expanduser(WALLPAPER_PATH)
if len(sys.argv) > 1:
    wallpaper = f"{WALLPAPER_PATH}/{sys.argv[1]}"
    sbp.run(
        shlex.split(
            f'xwallpaper --tile "{wallpaper}"'
        ),
        stdout=sbp.DEVNULL
    )
    sbp.run(
        [
            "ln",
            "-sf",
            wallpaper,
            os.path.expanduser('~/.local/state/wallpaper/current_wallpaper')
        ],
        stdout=sbp.DEVNULL
    )
    exit(0)

rofi_t = string.Template(f"$text\0icon\x1f{WALLPAPER_PATH}/$icon\n")
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
