#!/usr/bin/env bash

# Connectivity info for Linux VM
NIXADDR=192.168.64.8
NIXPORT=22
NIXUSER=root
NIXNAME=sabi

SSH_OPTIONS="-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

# GPG keyring
rsync -av -e "ssh ${SSH_OPTIONS}" \
    --exclude='.#*' \
    --exclude='S.*' \
    --exclude='*.conf' \
    ${HOME}/.gnupg/ ${NIXUSER}@${NIXADDR}:~/.gnupg

# SSH keys
rsync -av -e "ssh ${SSH_OPTIONS}" \
    --exclude='environment' \
    ${HOME}/.ssh/ ${NIXUSER}@${NIXADDR}:~/.ssh

rsync -av -e "ssh ${SSH_OPTIONS} -p${NIXPORT}" \
    --exclude='.history/'    \
    --exclude='result'       \
    --exclude='result/'      \
    --exclude='.vscode/'     \
    --exclude='vendor/'      \
    --exclude='.git/'        \
    --exclude='.git-crypt/'  \
    --exclude='iso/'          \
    --rsync-path="sudo rsync"  \
    ${PWD}/ ${NIXUSER}@${NIXADDR}:/nix-config

ssh ${SSH_OPTIONS} -p${NIXPORT} ${NIXUSER}@${NIXADDR} " \
    sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --verbose --keep-failed --flake \"/nix-config#${NIXNAME}\" \

"
