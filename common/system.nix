{ config, pkgs, lib, ... }:
{
  imports = [
    ./spotifyd/system.nix
  ];

  nix = {
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };
}
