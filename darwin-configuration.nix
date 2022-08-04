{ config, pkgs, lib, ... }:
{
  imports = [
    ./hosts/wabi
    #./common/system.nix
    #./darwin/system
  ];
}
