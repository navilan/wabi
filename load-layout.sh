#!/usr/bin/env bash

directory="$HOME/.config/cache/yabai/layouts"
mkdir -p $directory
ND=$(yabai -m query --displays | jq 'length')
filename="layout-d${ND}.sh"
if [ -f  $directory/$filename ]; then
    echo "file exists"
    sh $directory/$filename
    sh $HOME/.bin/spacer.sh
else
    echo "file does not exist"
fi
