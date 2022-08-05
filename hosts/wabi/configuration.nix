{ pkgs, user, ... }:
{
  imports = [
    ../../common/system.nix
    ../../darwin/system
  ];
  environment = {
    loginShell = pkgs.zsh;
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [ 
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nix.allowedUsers = [ "${user}" ];
  nix.package = pkgs.nixUnstable;

  users.users."${user}" = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  users.nix.configureBuildUsers = true;

  programs = {
    zsh.enable = true;
  };

  services.nix-daemon = {
    enable = true;
  };

  networking = {
    hostName = "wabi";
    computerName = "wabi";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      nerdfonts
      recursive
    ];
  };

  system.stateVersion = 4;
}
