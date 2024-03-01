#!/usr/bin/env sh

SPACE_ICONS=(_ 1 2 3 4 5 6 7 8 9 0)

sid=10
while [ $sid -gt 0 ]
do
  sketchybar --add space      space.$sid right                                \
             --set space.$sid associated_space=$sid                           \
                              icon=${SPACE_ICONS[$sid]}                       \
                              icon.padding_left=22                            \
                              icon.padding_right=22                           \
                              label.padding_right=33                          \
                              icon.highlight_color=$GREY                      \
                              icon.color=$BLACK                               \
                              label.font="sketchybar-app-font:Regular:16.0"   \
                              label.background.height=26                      \
                              label.background.color=$BG0                     \
                              label.background.drawing=on                     \
                              label.background.padding_left=8                 \
                              label.background.padding_right=8                \
                              label.background.color=$INACTIVE_TAB_BACKGROUND \
                              label.color=$WHITE                              \
                              label.background.corner_radius=9                \
                              label.drawing=off                               \
                              click_script="$SPACE_CLICK_SCRIPT"
  sid=$(("$sid"-1))
done

ND=$(yabai -m query --displays | jq 'length')
while [ $ND -gt 0 ]
do
     DSPCS=$(yabai -m query --spaces | jq --argjson d $ND -r 'map(select(.display == $d)) | reverse | map("space.\(.index)") | .[]' | xargs echo)
     sketchybar --add bracket spaces.$ND ${DSPCS} \
                --set spaces.$ND                  \
                      background.color=$PITCH     \
                      associated_display=$ND      \
                      background.height=38        \
                      background.padding_left=20  \
                      background.padding_right=20 \
                      background.corner_radius=11
     ND=$(("$ND"-1))
done
