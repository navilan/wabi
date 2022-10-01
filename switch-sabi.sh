#!/usr/bin/env bash

# Connectivity info for Linux VM
NIXADDR=192.168.64.8
NIXPORT=22
NIXUSER=navilan
NIXNAME=sabi


ssh -p${NIXPORT} ${NIXUSER}@${NIXADDR} " \
    sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake \"./wabi#${NIXNAME}\" \
"
