#!/usr/bin/env sh

next ()
{
  osascript -e 'tell application "Spotify" to play next track'
}

back ()
{
  osascript -e 'tell application "Spotify" to play previous track'
}

play ()
{
  osascript -e 'tell application "Spotify" to playpause'
}

repeat ()
{
  REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
  if [ "$REPEAT" = "false" ]; then
    sketchybar -m --set spotify.repeat icon.highlight=on
    osascript -e 'tell application "Spotify" to set repeating to true'
  else
    sketchybar -m --set spotify.repeat icon.highlight=off
    osascript -e 'tell application "Spotify" to set repeating to false'
  fi
}

shuffle ()
{
  SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
  if [ "$SHUFFLE" = "false" ]; then
    sketchybar -m --set spotify.shuffle icon.highlight=on
    osascript -e 'tell application "Spotify" to set shuffling to true'
  else
    sketchybar -m --set spotify.shuffle icon.highlight=off
    osascript -e 'tell application "Spotify" to set shuffling to false'
  fi
}

update ()
{
  PLAYING=1
  INF=$(echo "$INFO" | iconv -f utf-8 -t utf-8 -c)
  if [ "$(echo "$INF" | jq -r '.["Player State"]')" = "Playing" ]; then
    PLAYING=0
    TRACK="$(echo  "$INF"  | jq -r .Name   | cut -c 1-25)"
    ARTIST="$(echo "$INF"  | jq -r .Artist | cut -c 1-25)"
    ALBUM="$(echo  "$INF"  | jq -r .Album  | cut -c 1-25)"
    SHUFFLE=$(osascript -e 'tell application "Spotify" to get shuffling')
    REPEAT=$(osascript -e 'tell application "Spotify" to get repeating')
    COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
    if [ "$ARTIST" == "" ]; then
      args+=(--set spotify.title label="$TRACK" drawing=on \
             --set spotify.artist label="$ALBUM" drawing=on )
    else
      args+=(--set spotify.title label="$TRACK" drawing=on \
             --set spotify.artist label="$ARTIST" drawing=on)
    fi
    args+=(--set spotify.play icon=􀊆 \
           --set spotify.shuffle icon.highlight=$SHUFFLE \
           --set spotify.repeat icon.highlight=$REPEAT \
           --set spotify.cover popup.background.image="/tmp/cover.jpg" \
                               popup.background.color=0x000000 \
           --set spotify drawing=on                                     )
  else
    args+=(--set spotify.title drawing=off \
           --set spotify.artist drawing=off \
           --set spotify.cover popup.drawing=off \
           --set spotify.play icon=􀊄              )
  fi
  sketchybar -m "${args[@]}"
}

mouse_clicked () {
  case "$NAME" in
    "spotify.next") next
    ;;
    "spotify.back") back
    ;;
    "spotify.play") play
    ;;
    "spotify.shuffle") shuffle
    ;;
    "spotify.repeat") repeat
    ;;
    *) exit
    ;;
  esac
}

popup () {
  sketchybar --set spotify.cover popup.drawing=$1
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") popup on
  ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  *) update
  ;;
esac
