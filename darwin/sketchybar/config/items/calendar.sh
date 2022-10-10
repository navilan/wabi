#!/usr/bin/env sh
#

sketchybar --add item     calendar right                   \
           --set calendar icon=cal                         \
                          icon.color=$BG                   \
                          icon.font="$FONT:Black:14.0"     \
                          icon.padding_left=5              \
                          icon.padding_right=5             \
                          label.color=$GREY                \
                          label.font="$FONT:Black:14.0"    \
                          label.padding_left=5             \
                          label.padding_right=5            \
                          width=140                        \
                          align=center                     \
                          background.color=$BLACK1         \
                          background.height=26             \
                          background.corner_radius=9       \
                          script="$PLUGIN_DIR/calendar.sh" \
                          updates=on                       \
                          update_freq=1
