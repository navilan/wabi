{ config, pkgs, lib, ...}:
{
  home.file = {
    ".config/spotifyd/spotifyd.conf" = {
      source = ./spotifyd.conf;
    };
  };
}
