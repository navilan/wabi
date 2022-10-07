#!/usr/bin/env sh

TERM=xterm-256color result/sw/bin/darwin-rebuild switch --flake ".#wabi" # --verbose --keep-failed  --show-trace
