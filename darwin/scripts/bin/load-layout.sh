#!/usr/bin/env bash

directory="$HOME/.config/cache/yabai/layouts"
mkdir -p $directory
ND=$(yabai -m query --displays | jq 'length')
filename="layout-d${ND}.sh"
if [ -f  $directory/$filename ]; then
    sh $directory/$filename
fi
