#!/usr/bin/env bash


BACKGROUND="$HOME/wabi/backgrounds/haskell.jpg"
defaults write com.apple.desktop Background "{default = {ImageFilePath=\"$BACKGROUND\"; };}"
