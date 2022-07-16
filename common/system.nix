{ config, pkgs, lib, ... }:
{
  imports = [
    ./spotifyd/system.nix
  ];
}