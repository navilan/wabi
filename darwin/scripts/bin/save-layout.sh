#!/usr/bin/env bash
directory="$HOME/.config/cache/yabai/layouts"
mkdir -p $directory
ND=$(yabai -m query --displays | jq 'length')
filename="layout-d${ND}.sh"
yabai -m query --windows | \
    jq -re '.[] | select(.minimized != 1) | "yabai -m window \(.id) --display \(.display) --space \(.space) --move abs:\(.frame.x):\(.frame.y) --resize abs:\(.frame.w):\(.frame.h)"' \
    > $directory/$filename
chmod +x $directory/$filename
