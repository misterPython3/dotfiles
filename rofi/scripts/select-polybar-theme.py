#!/usr/bin/python3
import re
import os
import sys
import os.path as path
import subprocess as sbp
import shlex

THEME_FOLDER = "~/.config/polybar/colors/"

if len(sys.argv) > 1:
    file_path = os.getenv("ROFI_INFO")
    if path.exists(file_path):
        sbp.run([
            "ln",
            "-sf",
            file_path,
            path.join(path.expanduser(THEME_FOLDER), "colors.ini")
        ],
                stdout=sbp.DEVNULL,
                stderr=sbp.DEVNULL
                )
        sbp.run(
            shlex.split("polybar-msg cmd restart"),
            stdout=sbp.DEVNULL,
            stderr=sbp.DEVNULL
        )
    os.exit(0)

FILE_EXTENSION = ".colors.ini"
PATTERN = re.compile(f".*\\{FILE_EXTENSION}$")

THEME_FOLDER = path.expanduser(THEME_FOLDER)
if not path.isdir(THEME_FOLDER):
    os.exit(1)

FILES = [i for i in os.listdir(THEME_FOLDER) if PATTERN.match(i)]
MESSAGE_TEMPLATE = "{text}\0info\x1f{info}\n"

for filename in FILES:
    file_path = path.join(THEME_FOLDER, filename)
    sys.stdout.write(
        MESSAGE_TEMPLATE.format(
            text=filename.removesuffix(FILE_EXTENSION),
            info=file_path
        )
    )
