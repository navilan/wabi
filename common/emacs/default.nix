{ config, pkgs, lib, ... }: 
{
  home.file = {
    ".doom.d" = {
        source = config.lib.file.mkOutOfStoreSymlink ./doom.d;
    };
  };
}