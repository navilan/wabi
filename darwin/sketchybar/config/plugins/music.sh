#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors


STS=$(spt pb --status 2>&1)
ICON=$(echo     "$STS" | awk '{ print $2 }')
SHUFFLE=$(echo  "$STS" | awk '{ print $1 }')

STS_PLAYING="▶"
STS_PAUSED="⏸"

SONG=$(echo     "$STS" | awk -F "$STS_PLAYING | $STS_PAUSED" '{ print $2 }')
PU="⏸"
PL="▶"
ST="■"
LBL=$(echo "$SONG" | cut -c 1-50)


if [ "$ICON" == "$STS_PLAYING" ]; then
    MFG=$BLUE
    ICN=$PL
elif [ "$ICON" == "$STS_PAUSED" ]; then
    MFG=$BLACK
    ICN=$PU
else
    MFG=$FG
    ICN=$ST
    LBL="Run SPT"
fi

sketchybar --set $NAME  label="$LBL"    \
                        icon="$ICN"     \
                        icon.color=$MFG \
                        label.color=$MFG
