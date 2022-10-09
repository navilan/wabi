#!/usr/bin/env sh

SPACE_ICONS=(1 2 3 4 5 6 7 8 9)

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                                 \
             --set space.$sid associated_space=$sid                           \
                              icon=${SPACE_ICONS[i]}                          \
                              icon.padding_left=22                            \
                              icon.padding_right=22                           \
                              label.padding_right=33                          \
                              icon.highlight_color=$GREY                      \
                              icon.color=$FG                                  \
                              background.padding_left=-8                      \
                              background.padding_right=-8                     \
                              background.height=40                            \
                              background.corner_radius=11                     \
                              background.color=$ACTIVE_ITEM_FOREGROUND        \
                              background.drawing=on                           \
                              label.font="sketchybar-app-font:Regular:16.0"   \
                              label.background.height=32                      \
                              label.background.color=$BLACK1                  \
                              label.background.drawing=on                     \
                              label.background.color=$INACTIVE_TAB_BACKGROUND \
                              label.color=$WHITE                              \
                              label.background.corner_radius=9                \
                              label.drawing=off                               \
                              script=""                                       \
                              mach_helper="$HELPER"                           \
                              click_script="$SPACE_CLICK_SCRIPT"
done

sketchybar   --add item       separator left                                  \
             --set separator  icon=                                           \
                              icon.font="PragmataPro:Bold:16.0"               \
                              background.padding_left=26                      \
                              background.padding_right=15                     \
                              label.drawing=off                               \
                              icon.highlight_color=$ACTIVE_ITEM_FOREGROUND    \
                              icon.color=$INACTIVE_ITEM_FOREGROUND
