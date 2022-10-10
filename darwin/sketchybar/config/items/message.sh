#!/usr/bin/env sh
sketchybar --add event   message_changed                              \
           --add item    message left                                 \
           --set message label="$MSG"                                 \
                         icon.font="sketchybar-app-font:Regular:16.0" \
                         icon.padding_left=5                          \
                         icon.padding_right=5                         \
                         icon="$ICON"                                 \
                         icon.color=$ACTIVE_ITEM_BACKGROUND           \
                         icon.align=center                            \
                         label.padding_left=5                         \
                         label.padding_right=5                        \
                         label.drawing=on                             \
                         label.font="$FONT:Regular:16.0"              \
                         label.color=$BG                              \
                         icon.drawing=on                              \
                         background.drawing=on                        \
                         background.color=$ACTIVE_BORDER_COLOR        \
                         background.corner_radius=9                   \
                         background.height=30                         \
                         background.padding_left=5                    \
                         background.padding_right=5                   \
                         align=center                                 \
                         script=${PLUGIN_DIR}/message.sh              \
                         updates=on                                   \
           --subscribe message      message_changed
