{ config, pkgs, lib, ... }: {
  home.file.k9s = {
    target = ".config/k9s/plugin.yml";
    source = ./plugin.yml;
  };
}
