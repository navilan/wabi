#!/usr/bin/env sh
sketchybar --add event   message_changed                          \
           --add item    message left                             \
           --set message label="$MSG"                             \
                         icon.font="$FONT:Black:18.0"             \
                         icon.padding_left=5                      \
                         icon.padding_right=5                     \
                         icon="$ICON"                             \
                         icon.color=$ACTIVE_ITEM_BACKGROUND       \
                         label.padding_left=5                     \
                         label.padding_right=9                    \
                         label.drawing=on                         \
                         label.font="$FONT:Regular:16.0"          \
                         label.color=$ACTIVE_ITEM_FOREGROUND      \
                         icon.drawing=on                          \
                         background.drawing=on                    \
                         background.color=$ACTIVE_BORDER_COLOR    \
                         background.corner_radius=9               \
                         background.height=30                     \
                         align=center                             \
                         script=${PLUGIN_DIR}/message.sh          \
                         updates=on                               \
           --subscribe message      message_changed
