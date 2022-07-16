#!/usr/bin/env bash
ND=$(yabai -m query --displays | jq 'length')

d1=$(sh ./display-index.sh 0)
d2=$(sh ./display-index.sh 1)
d3=$(sh ./display-index.sh 2)
d4=$(sh ./display-index.sh 3)

[ "$ND" -eq 1 ]; D1=$d1; D2=$d1; D3=$d1; D4=$d1;
[ "$ND" -eq 2 ]; D1=$d1; D2=$d2; D3=$d1; D4=$d1;
[ "$ND" -eq 3 ]; D1=$d1; D2=$d2; D3=$d3; D4=$d3;
[ "$ND" -eq 4 ]; D1=$d1; D2=$d2; D3=$d3; D4=$d4;

yabai -m space --focus s10 && yabai -m space --display $D2
yabai -m space --focus s9  && yabai -m space --display $D4
yabai -m space --focus s8  && yabai -m space --display $D4
yabai -m space --focus s7  && yabai -m space --display $D2
yabai -m space --focus s6  && yabai -m space --display $D4
yabai -m space --focus s5  && yabai -m space --display $D2
yabai -m space --focus s4  && yabai -m space --display $D4
yabai -m space --focus s3  && yabai -m space --display $D3
yabai -m space --focus s2  && yabai -m space --display $D2
yabai -m space --focus s1  && yabai -m space --display $D1