#!/usr/bin/env sh
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors


sketchybar --set $NAME  label="$MSG" \
                        icon="$ICON" \
                        icon.color=$ACTIVE_ITEM_BACKGROUND \
                        label.color=$ACTIVE_ITEM_BACKGROUND \
                        background.color="$BGC"
