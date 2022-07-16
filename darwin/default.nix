{ config, pkgs, lib, ... }:
{
  imports = [
    ./adblock
    ./scripts
    ./skhd
    ./spacebar
    ./yabai
  ];
}