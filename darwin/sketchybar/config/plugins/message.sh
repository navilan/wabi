#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

sketchybar --set $NAME  label="$MSG" \
                        icon="$ICON" \
                        icon.color=$FGC \
                        label.color=$FGC \
                        background.color="$BGC"
