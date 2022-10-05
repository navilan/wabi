#!/usr/bin/env bash


BACKGROUND="$HOME/wabi/backgrounds/haskell.jpg"
defaults write com.apple.desktop Background "{default = {ImageFilePath=\"$BACKGROUND\"; };}"
killall Dock


CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
osascript $CDIR/wp.scpt
