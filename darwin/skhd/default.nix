{ config, pkgs, lib, ... }:
{
  home.file = {
    ".config/skhd/skhdrc" = {
        source = config.lib.file.mkOutOfStoreSymlink ./skhdrc;
    };
  };
}