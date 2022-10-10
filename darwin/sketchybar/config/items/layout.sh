#!/usr/bin/env sh

sketchybar --add       event        space_layout_changed          \
           --add       event        window_focus                  \
           --add       event        windows_on_spaces             \
           --add       event        message_changed               \
           --add       item         system.yabai left             \
           --set       system.yabai script="$PLUGIN_DIR/yabai.sh" \
                                    icon.font="$FONT:Bold:16.0"   \
                                    label.drawing=off             \
                                    icon.width=60                 \
                                    icon.align=center             \
                                    icon=$YABAI_GRID              \
                                    icon.color=$BG0               \
                                    background.color=$PITCH       \
                                    background.padding_left=5     \
                                    background.padding_right=5    \
                                    align=center                  \
                                    background.height=26          \
                                    updates=on                    \
           --subscribe system.yabai window_focus                  \
                                    windows_on_spaces             \
                                    space_layout_changed          \
                                    mouse.clicked
