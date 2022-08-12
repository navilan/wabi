{ config, pkgs, lib, ... }:
{
  imports = [
    ./git
    ./tmux
    ./vim
    ./zsh
  ];
}
