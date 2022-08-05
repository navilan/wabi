{ config, inputs, lib, pkgs, ... }:

{
  nix.binaryCaches = [
    "https://cachix.org/api/v1/cache/emacs"
  ];

  nix.binaryCachePublicKeys = [
    "emacs.cachix.org-1:b1SMJNLY/mZF6GxQE+eDBeps7WnkT0Po55TAyzwOxTY="
  ];

  nixpkgs.overlays = [
    inputs.emacs.overlay
    inputs.emacs-overlay.overlay
  ];

 }
