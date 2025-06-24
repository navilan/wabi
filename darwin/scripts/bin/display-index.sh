#!/usr/bin/env bash

INDEX=${1}
yabai -m query --displays | jq --argjson idx $INDEX 'sort_by(.frame.w, .frame.x) | map(.index) | .[$idx]'