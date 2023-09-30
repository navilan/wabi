{ config, pkgs, lib, ... }:

let p = import ../../lib/platforms.nix { inherit config pkgs; };
in {
  home.file = {
    ".config/kitty/kood" = { source = p.mkSource ./kood-session; };
  };
}
