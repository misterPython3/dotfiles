#!/usr/bin/python3
import os
import sys
import subprocess as sbp
import string
import shlex

OPENBOX_THEME_PATH = os.getenv("OPENBOX_THEME_PATH")
if OPENBOX_THEME_PATH is None or OPENBOX_THEME_PATH == "" or not os.path.isdir(OPENBOX_THEME_PATH):
    OPENBOX_THEME_PATH = "~/.local/share/themes"
OPENBOX_THEME_PATH = os.path.expanduser(OPENBOX_THEME_PATH)
if len(sys.argv) > 1:
    theme = f"{OPENBOX_THEME_PATH}/{sys.argv[1]}"
    sbp.run(
        [
            "ln",
            "-sfn",
            theme,
            os.path.expanduser("~/.themes/openbox_theme")
        ],
        stdout=sbp.DEVNULL
    )
    sbp.run(
        shlex.split("openbox --reconfigure"),
        stdout=sbp.DEVNULL
    )
    exit(0)

theme_t = string.Template("$text\n")
os.chdir(OPENBOX_THEME_PATH)
files = sorted([i for i in os.listdir() if os.path.isdir(i)])
for data in files:
    sys.stdout.write(
        theme_t.substitute({
            "text": data,
        })
    )
