#!/usr/bin/python3
import re
import os
import sys
import os.path as path
import subprocess as sbp
import shlex

if len(sys.argv) > 1:
    file_path = os.getenv("ROFI_INFO")
    if path.exists(file_path):
        sbp.run(shlex.split("xwallpaper --tile") + [file_path])
    os.exit(0)


IMAGE_FOLDER = "~/.config/i3/wallpapers"
PATTERN = re.compile(".*\\.(pn|jpe?)g$")

IMAGE_FOLDER = path.expanduser(IMAGE_FOLDER)
if not path.isdir(IMAGE_FOLDER):
    IMAGE_FOLDER = path.expanduser("~/Downloads")

FILES = [i for i in os.listdir(IMAGE_FOLDER) if PATTERN.match(i)]
MESSAGE_TEMPLATE = "{text}\0icon\x1f{icon}\x1finfo\x1f{info}\n"

for filename in FILES:
    file_path = path.join(IMAGE_FOLDER, filename)
    sys.stdout.write(
        MESSAGE_TEMPLATE.format(
            text=filename,
            icon=file_path,
            info=file_path
        )
    )
