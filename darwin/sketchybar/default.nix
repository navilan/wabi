{ config, pkgs, lib, ... }:

let p = import ../../lib/platforms.nix { inherit config pkgs; };
in {
  home.file = { ".config/sketchybar" = { source = p.mkSource ./config; }; };
}
