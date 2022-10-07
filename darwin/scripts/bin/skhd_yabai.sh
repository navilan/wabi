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


if which spacebar >/dev/null; then
  case "$1" in
    highlight_default) # default
      spacebar -m config background_color 0x88282a36
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config center_shell     off
      spacebar -m config title            on
      ;;
    highlight_active)
      spacebar -m config background_color 0xff4499f0
      spacebar -m config foreground_color 0x88282a36
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "(f)ocus|(g)rid|(s)wap|(m)ove|(r)esize|(t)oggle"'
      ;;
    highlight_shorts)
      spacebar -m config background_color 0x004787f0
      spacebar -m config foreground_color 0x88282a36
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "(r)estart|(a)app|(y)abai|(f)ocus|fw(hjkl+wsd)|fd(#)|fs(S#)"'
      ;;
    highlight_yabai)
      spacebar -m config background_color 0x004787f0
      spacebar -m config foreground_color 0x88282a36
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "(s)ave layout|(l)oad layout"'
      ;;
    highlight_focus)
      spacebar -m config background_color 0x00ffd2f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "focus (w)indow|(s)pace|(d)isplay|(a)pp"'
      ;;
    highlight_grid)
      spacebar -m config background_color 0xdadef4f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "grid (hjkl)+alt"'
      ;;
    highlight_swap)
      spacebar -m config background_color 0xa4aed6f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "swap (w)indow|(s)pace|(d)isplay"'
      ;;
    highlight_move)
      spacebar -m config background_color 0x6a6fb1f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "move (w)indow|(s)pace|(d)isplay"'
      ;;
    highlight_resize)
      spacebar -m config background_color 0x000000f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "resize (hjkl)+alt|balance(=)|(m)ax|(c)enter"'
      ;;
    highlight_toggle)
      spacebar -m config background_color 0x8590c5f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "toggle (w)indow|(s)pace"'
      ;;
    highlight_focus_window)
      spacebar -m config background_color 0x00ffd2f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "focusW (hjklpnrm)"'
      ;;
    highlight_focus_space)
      spacebar -m config background_color 0x00ffd2f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "focusS (hjkl)|space(#)"'
      ;;
    highlight_focus_display)
      spacebar -m config background_color 0x00ffd2f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "focusD (hjkl)|display(#)"'
      ;;
    highlight_focus_app)
      spacebar -m config background_color 0x00ffd2f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "focusA (e)macs|(v)scode|(s)afari|(c)hrome|(f)irefox|(q)uteb|(k)itty"'
      ;;
    highlight_move_window)
      spacebar -m config background_color 0x6a6fb1f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "moveW space(hjkl#)|display(Chjkl#)"'
      ;;
    highlight_move_space)
      spacebar -m config background_color 0x6a6fb1f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "moveS display(hjkl#)"'
      ;;
    highlight_swap_window)
      spacebar -m config background_color 0xa4aed6f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "swapW space(hjkl#)|display(Chjkl#)"'
      ;;
    highlight_swap_space)
      spacebar -m config background_color 0xa4aed6f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "swapS display(hjkl#)"'
      ;;
    highlight_toggle_window)
      spacebar -m config background_color 0x8590c5f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "toggleW (f)loat|(s)ticky|(t)op|(b)order|spl(i)t|(p)ip|(z)oom|(m)ax|full(Sm)|(q)uit|(c)enter"'
      ;;
    highlight_toggle_space)
      spacebar -m config background_color 0x8590c5f0
      spacebar -m config foreground_color 0x88eff0eb
      spacebar -m config title            off
      spacebar -m config center_shell     on
      spacebar -m config center_shell_command 'echo "toggleS gap(o)|balance(=)|(b)sp|(f)loat|(s)tack|(d)esktop"'
      ;;
  esac
fi
