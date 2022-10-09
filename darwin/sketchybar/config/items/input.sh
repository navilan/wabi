#!/usr/bin/env sh
#
sketchybar                                                                  \
    --add event input_change 'AppleSelectedInputSourcesChangedNotification' \
    --add item input right                                                  \
    --set input script="$PLUGIN_DIR/input.sh"                               \
                icon.color=$GREY                                            \
                icon.font="$FONT:Black:16.0"                                \
                icon.padding_left=5                                         \
                icon.padding_right=2                                        \
                background.color=$BLACK1                                    \
                background.height=26                                        \
                background.corner_radius=11                                 \
                align=center                                                \
    --subscribe input input_change
