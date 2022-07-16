{ config, pkgs, lib, ... }:
{
  home.file = {
    ".config/yabai/yabairc" = {
        source = config.lib.file.mkOutOfStoreSymlink ./yabairc;
    };
  };
}