#!/bin/sh

  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"


window_state() {

  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  icon=""

  yabai_mode=$(yabai -m query --spaces --space | jq -r .type)
  case "$yabai_mode" in
      bsp)
      icon="$YABAI_BSP "
      ;;
      stack)
      icon="$YABAI_STACK "
      ;;
      float)
      icon="$YABAI_FLOAT "
      ;;
  esac


  if [[ $CURRENT -gt 0 ]]; then
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    icon+=$YABAI_STACK
    args+=(--set $NAME icon=$icon label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
  else
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          icon+=$YABAI_FULLSCREEN_ZOOM
          args+=(--set $NAME icon=$icon)
        elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
          icon+=$YABAI_PARENT_ZOOM
          args+=(--set $NAME icon=$icon)
        else
          icon+=$YABAI_GRID
          args+=(--set $NAME icon=$icon)
        fi
        ;;
      "true")
          icon+=$YABAI_FLOAT
          args+=(--set $NAME icon=$icon)
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}


windows_on_spaces () {

  DISPLAY_INFO="$(yabai -m query --displays)"
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=()
  while read -r line
  do
    for space in $line
    do
      icon_strip=" "
      apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
      for app in $apps
      do
        icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
      done
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
    done
  done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"

}

mouse_clicked() {
  yabai -m window --toggle float
  update
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  "window_focus") window_state 
  ;;
  "windows_on_spaces") windows_on_spaces
  ;;
esac
