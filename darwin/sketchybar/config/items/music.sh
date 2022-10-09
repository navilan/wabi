#!/usr/bin/env sh
sketchybar --add item    music right                              \
           --set music   label="$MSG"                             \
                         icon.font="$FONT:Black:18.0"             \
                         icon.padding_left=5                      \
                         icon.padding_right=5                     \
                         icon="$SPOTIFY_PLAY_PAUSE"               \
                         icon.color=$BG                           \
                         label.padding_left=5                     \
                         label.padding_right=9                    \
                         label.drawing=on                         \
                         label.font="$FONT:Regular:16.0"          \
                         label.color=$BG                          \
                         label="-"                                \
                         icon.drawing=on                          \
                         background.drawing=on                    \
                         background.color=$PITCH                  \
                         background.corner_radius=11              \
                         background.height=30                     \
                         align=center                             \
                         script=${PLUGIN_DIR}/music.sh            \
                         updates=on
