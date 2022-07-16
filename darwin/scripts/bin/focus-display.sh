#!/usr/bin/env bash

INDEX=${1}
D=$(~/.bin/display-index.sh "${INDEX}")
if [ -z "$D" ]
then
    D="${INDEX}"
fi


yabai -m display --focus "${D}"