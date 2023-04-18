{ config, pkgs, lib, ... }: {

  home = { file = { ".ideavimrc" = { source = ./ideavimrc; }; }; };
}
