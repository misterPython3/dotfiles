#!/usr/bin/python3
import os
import sys
import subprocess as sbp
import glob
import string

ROFI_THEME_PATH = os.getenv("ROFI_THEME_PATH")
if ROFI_THEME_PATH is None or ROFI_THEME_PATH == "" or not os.path.isdir(ROFI_THEME_PATH):
    ROFI_THEME_PATH = "~/.local/share/rofi/themes"
ROFI_THEME_PATH = os.path.expanduser(ROFI_THEME_PATH)
if len(sys.argv) > 1:
    theme = f"{ROFI_THEME_PATH}/{sys.argv[1]}"
    sbp.run(
        [
            "ln",
            "-sf",
            theme,
            os.path.expanduser("~/.config/rofi/theme.rasi")
        ],
        stdout=sbp.DEVNULL
    )
    exit(0)

theme_t = string.Template("$text\n")
os.chdir(ROFI_THEME_PATH)
filetypes = ["*.rasi"]
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
