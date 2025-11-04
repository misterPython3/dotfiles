#!/usr/bin/python3
import os
import sys
import subprocess as sbp
import glob
import string
import shlex

POLYBAR_THEME_PATH = os.getenv("POLYBAR_THEME_PATH")
if POLYBAR_THEME_PATH is None or POLYBAR_THEME_PATH == "" or not os.path.isdir(POLYBAR_THEME_PATH):
    POLYBAR_THEME_PATH = "~/.local/share/polybar/themes"
POLYBAR_THEME_PATH = os.path.expanduser(POLYBAR_THEME_PATH)
if len(sys.argv) > 1:
    theme = f"{POLYBAR_THEME_PATH}/{sys.argv[1]}"
    sbp.run(
        [
            "ln",
            "-sf",
            theme,
            os.path.expanduser("~/.config/polybar/colors.ini")
        ],
        stdout=sbp.DEVNULL
    )
    sbp.run(
        shlex.split("polybar-msg cmd restart"),
        stdout=sbp.DEVNULL
    )
    exit(0)

theme_t = string.Template("$text\n")
os.chdir(POLYBAR_THEME_PATH)
filetypes = ["*.ini"]
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
