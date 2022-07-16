{ config, pkgs, lib, ... }:
{
  home.file = {
    ".config/spacebar/spacebarrc" = {
        source = config.lib.file.mkOutOfStoreSymlink ./spacebarrc;
    };
  };
}