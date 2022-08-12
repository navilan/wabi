#!/usr/bin/env bash

nix build --extra-experimental-features 'nix-command flakes' .#devContainers.dc.activationPackage
./result/activate
echo ""
echo "***************************************************"
echo "dotfiles installation complete"
echo "***************************************************"
echo ""
