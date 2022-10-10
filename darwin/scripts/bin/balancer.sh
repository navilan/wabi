#!/usr/bin/env bash
ND=$(yabai -m query --displays | jq 'length')

CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
d1=$(sh $CDIR/display-index.sh 0)
d2=$(sh $CDIR/display-index.sh 1)
d3=$(sh $CDIR/display-index.sh 2)
d4=$(sh $CDIR/display-index.sh 3)

if [ "$ND" -eq 1 ]; then D1=$d1; D2=$d1; D3=$d1; D4=$d1; D5=$d1; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4 $D5]"; fi
if [ "$ND" -eq 2 ]; then D1=$d1; D2=$d2; D3=$d1; D4=$d1; D5=$d2; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4 $D5]"; fi
if [ "$ND" -eq 3 ]; then D1=$d1; D2=$d1; D3=$d2; D4=$d3; D5=$d3; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4 $D5]"; fi
# iPad on the left
if [ "$ND" -eq 4 ]; then D1=$d2; D2=$d2; D3=$d3; D4=$d4; D5=$d1; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4 $D5]"; fi


# yabai -m space --focus s10 && yabai -m space --display $D3 # Unused
# yabai -m space --focus s9  && yabai -m space --display $D2 # Unused
yabai -m space --focus s8  && yabai -m space --display $D5 # Untagged
sh $CDIR/wp.sh
yabai -m space --focus s7  && yabai -m space --display $D5 # Spotify
sh $CDIR/wp.sh
yabai -m space --focus s6  && yabai -m space --display $D4 # kitty
sh $CDIR/wp.sh
yabai -m space --focus s5  && yabai -m space --display $D3 # Safari
sh $CDIR/wp.sh
yabai -m space --focus s4  && yabai -m space --display $D3 # Chrome
sh $CDIR/wp.sh
yabai -m space --focus s3  && yabai -m space --display $D3 # Firefox
sh $CDIR/wp.sh
yabai -m space --focus s2  && yabai -m space --display $D2 # VSCode
sh $CDIR/wp.sh
yabai -m space --focus s1  && yabai -m space --display $D1 # Emacs
sh $CDIR/wp.sh
