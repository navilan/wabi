#!/usr/bin/env sh
#
#
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
source "$HOME/.config/sketchybar/icons.sh" # Loads all defined colors

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"
IP="$(~/.bin/get-ip)"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME icon=$OFFLINE icon.color=$BLACK               \
             --set $NAME.ssid  label="Offline" label.color=$BLACK      \
             --set $NAME.speed label="0 MBPS" label.color=$BLACK       \
             --set $NAME.ip    label="-" label.color=$BG
else
  sketchybar --set $NAME icon=$ONLINE icon.color=$GREY                 \
             --set $NAME.ssid  label="$SSID" label.color=$BG           \
             --set $NAME.speed label="${CURR_TX} MBPS" label.color=$BG \
             --set $NAME.ip    label="$IP" label.color=$BG
fi
