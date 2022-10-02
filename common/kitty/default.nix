{ config, pkgs, lib, ... }: {

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kittyrc;
  };

}
