#!/usr/bin/python3
import os
import sys
import subprocess as sbp
import glob
import string

THEME_PATH = os.getenv("THEME_PATH")
if THEME_PATH is None or THEME_PATH == "" or not os.path.isdir(THEME_PATH):
    THEME_PATH = "~/.local/share/alacritty/themes"
THEME_PATH = os.path.expanduser(THEME_PATH)
if len(sys.argv) > 1:
    theme = f"{THEME_PATH}/{sys.argv[1]}"
    sbp.run(
        [
            "ln",
            "-sf",
            theme,
            os.path.expanduser("~/.config/alacritty/themes/theme.toml")
        ],
        stdout=sbp.DEVNULL
    )
    exit(0)

theme_t = string.Template("$text\n")
os.chdir(THEME_PATH)
filetypes = ["*.toml"]
files = []
for _type in filetypes:
    files.extend(glob.glob(_type))
else:
    files.sort()
for data in files:
    sys.stdout.write(
        theme_t.substitute({
            "text": data,
        })
    )
