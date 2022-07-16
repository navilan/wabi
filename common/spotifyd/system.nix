
{ config, pkgs, lib, ...}:
{
  services = {
    spotifyd = {
      enable = true;
    };
  };
}