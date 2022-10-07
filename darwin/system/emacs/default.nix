{ config, inputs, lib, pkgs, ... }:
let 
binary-caches = [ 
  # Nightly Emacs build cache for github:cmacrae/emacs 
  "https://cachix.org/api/v1/cache/emacs" 
  "https://cachix.org/api/v1/cache/nix-community"

];
public-keys = [ 
  "emacs.cachix.org-1:b1SMJNLY/mZF6GxQE+eDBeps7WnkT0Po55TAyzwOxTY=" 
  "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
];

in

{
  nix.settings = rec {
    substituters = binary-caches;
    trusted-public-keys = public-keys;
    trusted-substituters = substituters;
  };
  nixpkgs.overlays = with inputs; [ emacs.overlay ];
}
