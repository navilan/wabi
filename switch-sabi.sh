#!/usr/bin/env bash

# Connectivity info for Linux VM
NIXADDR=192.168.64.4
NIXPORT=22
NIXUSER=navilan
NIXNAME=sabi

SSH_OPTIONS="-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"


ssh ${SSH_OPTIONS} -p${NIXPORT} ${NIXUSER}@${NIXADDR} " \
    sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake \"/nix-config#${NIXNAME}\" \
"
