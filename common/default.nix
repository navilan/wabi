{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty
    ./emacs
    ./git
    ./k9s
    ./spotifyd
    ./tmux
    ./vim
    ./vscode
    ./zsh
  ];
}
