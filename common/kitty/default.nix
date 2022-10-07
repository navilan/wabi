{ config, pkgs, lib, ... }: {

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  xdg.configFile."kitty/themes".source = ./themes;
  xdg.configFile."kitty/keymap.conf".source = ./keymap.conf;

}
