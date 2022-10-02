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
