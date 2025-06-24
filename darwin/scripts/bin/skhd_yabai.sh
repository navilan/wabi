#!/usr/bin/env bash
#
#


# Mode

# Background Color
# Text Color
# Center Text (Prompt)

# Action
#
# Center Text (Prompt)

# Active (Long form verbs)
# BG: Violet

# Commands
# - Focus Window(w) | Space(s) | Display(d) | App(a)
# --- Window     Direction(hjkl) | Prev(p) | Next(n) | Recent(r) | Largest(m)
# --- Space      Prev(hjp) | Next(lkn) | Space(#)
# --- Display    Prev(hjp) | Next(lkn) | Display(#)
# - Swap  ("W | S | D" Window, Space, Display)
# --- Window ( "hjkl | m | # |S#" Direction, Largest, Space, Space)
# - Move  ("W | S | D" Window, Space, Display)
# - Toggle ("W | S | D" Window, Space, Display)

# Shorts (Quick access menu)
# BG: Purple
#
source "${HOME}/.config/sketchybar/colors.sh" # Loads all defined colors



WTITLE=$(yabai -m query --windows --window | jq -r '.title' | cut -c 1-50)
APP=$(yabai -m query --windows --window | jq -r '.app')
APP_ICON="$($HOME/.config/sketchybar/plugins/icon_map.sh "$APP")"
if which sketchybar >/dev/null; then
  case "$1" in
    highlight_default) # default
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="$WTITLE"                                                                                                 \
            ICON=$APP_ICON BGC=$PITCH FGC=$BG
      ;;
    highlight_active)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(f)ocus | (g)rid | (s)wap | (m)ove | (r)esize | (t)oggle"                                                \
            ICON="A"                                                                                                      \
            BGC="0xa0ccccff" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_shorts)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(r)estart | (a)app | (y)abai | (f)ocus | fw(hjkl+wsd) | fd(#) | fs(S#)"                                  \
            ICON="S"                                                                                                      \
            BGC="0xa000ccff" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_yabai)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(s)ave layout | (l)oad layout"                                                                           \
            ICON="Y"                                                                                                      \
            BGC="0xa044ff87" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_focus)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(w)indow | (s)pace | (d)isplay | (a)pp"                                                                  \
            ICON="F"                                                                                                      \
            BGC="0xa000ffd2" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_grid)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl)+alt"                                                                                              \
            ICON="G"                                                                                                      \
            BGC="0xa0dadef4" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_swap)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(w)indow | (s)pace | (d)isplay"                                                                          \
            ICON="S"                                                                                                      \
            BGC="0xa0a4aed6" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_move)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(w)indow | (s)pace | (d)isplay"                                                                          \
            ICON="M"                                                                                                      \
            BGC="0xa06a6fb1" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_resize)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl)+alt | balance(=) | (m)ax | (c)enter"                                                              \
            ICON="R"                                                                                                      \
            BGC="0xa0000000" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_toggle)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(w)indow | (s)pace"                                                                                      \
            ICON="T"                                                                                                      \
            BGC="0xa08590c5" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_focus_window)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjklpnrm)"                                                                                              \
            ICON="W"                                                                                                      \
            BGC="0xa000ffd2" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_focus_space)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl) | space(#)"                                                                                       \
            ICON="S"                                                                                                      \
            BGC="0xa000ffd2" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_focus_display)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl) | display(#)"                                                                                     \
            ICON="D"                                                                                                      \
            BGC="0xa000ffd2" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_focus_app)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(e)macs | (v)scode | (s)afari | (c)hrome | (f)irefox | (k)itty"                                          \
            ICON="A"                                                                                                      \
            BGC="0xa000ffd2" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_move_window)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl#) | display(Chjkl#)"                                                                               \
            ICON="W"                                                                                                      \
            BGC="0xa06a6fb1" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_move_space)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="display(hjkl#)"                                                                                          \
            ICON="S"                                                                                                      \
            BGC="0xa06a6fb1" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_swap_window)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(hjkl#) | display(Chjkl#)"                                                                               \
            ICON="W"                                                                                                      \
            BGC="0xa0a4aed6" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_swap_space)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="display(hjkl#)"                                                                                          \
            ICON="S"                                                                                                      \
            BGC="0xa0a4aed6" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_toggle_window)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="(f)loat | (s)ticky | (t)op | (b)order | spl(i)t | (p)ip | (z)oom | (m)ax | full(Sm) | (q)uit | (c)enter" \
            ICON="W"                                                                                                      \
            BGC="0xa08590c5" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
    highlight_toggle_space)
      sketchybar --trigger                                                                                                \
            message_changed                                                                                               \
            MSG="toggleS gap(o) | balance(=) | (b)sp | (f)loat | (s)tack | (d)esktop"                                     \
            ICON="S"                                                                                                      \
            BGC="0xa08590c5" FGC=$ACTIVE_ITEM_BACKGROUND
      ;;
  esac
fi
