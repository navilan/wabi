{ config, pkgs, lib, ... }:
{
  imports = [
    ./navilan.nix
  ];
  system.stateVersion = 4;
  environment = {
    systemPackages = with pkgs; [];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nix = {
    allowedUsers = [ "navilan" ];
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };

  networking = {
    hostName = "wabi";
    knownNetworkServices = [ "Wi-Fi" ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      nerdfonts
      recursive
    ];
  };
}
