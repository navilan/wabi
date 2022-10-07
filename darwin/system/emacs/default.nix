{ config, inputs, lib, pkgs, ... }:

{
  nix.settings.substituters = [
    # Nightly Emacs build cache for github.com/cmacrae/emacs
    "https://cachix.org/api/v1/cache/emacs"

    "https://cachix.org/api/v1/cache/nix-community"
  ];

  nix.settings.trusted-public-keys = [
    "cmacrae.cachix.org-1:5Mp1lhT/6baI3eAqnEvruhLrrXE9CKe27SbnXqjwXfg="
    "emacs.cachix.org-1:b1SMJNLY/mZF6GxQE+eDBeps7WnkT0Po55TAyzwOxTY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  nixpkgs.overlays = [ inputs.emacs.overlay inputs.emacs-overlay.overlay ];

}
