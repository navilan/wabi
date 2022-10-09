#!/usr/bin/env sh

sketchybar --add       event        space_layout_changed          \
           --add       event        window_focus                  \
           --add       event        windows_on_spaces             \
           --add       event        message_changed               \
           --add       item         system.yabai left             \
           --set       system.yabai script="$PLUGIN_DIR/yabai.sh" \
                                    icon.font="$FONT:Bold:20.0"   \
                                    label.drawing=off             \
                                    icon.width=60                 \
                                    icon=$YABAI_GRID              \
                                    icon.color=$BG0               \
                                    updates=on                    \
           --subscribe system.yabai window_focus                  \
                                    windows_on_spaces             \
                                    space_layout_changed          \
                                    mouse.clicked                 \
                                                                  \
           --add       item         front_app left                \
           --set       front_app    mach_helper="$HELPER"         \
                                    icon.drawing=off              \
                                    background.padding_left=0     \
                                    background.padding_right=10   \
                                    label.color=$BG0              \
                                    label.font="$FONT:Black:16.0" \
           --subscribe front_app    front_app_switched
