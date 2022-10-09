#!/usr/bin/env sh
#
POPUP_OFF="sketchybar --set wifi.control popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"


sketchybar --add item wifi right                        \
           --set wifi script="$PLUGIN_DIR/wifi.sh"      \
                      icon=$OFFLINE                     \
                      label.drawing=off                 \
                      icon.color=$GREY                  \
                      icon.padding_left=8               \
                      icon.padding_right=8              \
                      icon.font="$FONT:Black:16.0"      \
                      background.padding_right=12       \
                      background.color=$BLACK1          \
                      background.height=26              \
                      background.corner_radius=11       \
                      update_freq=5                     \
                      popup.horizontal=on               \
                      popup.background.color=$PITCH     \
                      popup.background.corner_radius=5  \
                      popup.align=right                 \
                      click_script="$POPUP_CLICK_SCRIPT"\
                      update_freq=10                    \
                                                        \
           --add item  wifi.ssid popup.wifi             \
           --set       wifi.ssid label="$SSID"          \
                         label.color="$FG"              \
                         click_script="$POPUP_OFF"      \
                                                        \
           --add item wifi.speed popup.wifi             \
           --set      wifi.speed label=$SPD             \
                         label.color="$FG"              \
                         click_script="$POPUP_OFF"      \
                                                        \
           --add item wifi.ip popup.wifi                \
           --set      wifi.ip label=$IP_LBL             \
                         label.color="$FG"              \
                         click_script="$POPUP_OFF"      \
