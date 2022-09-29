{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty
    ./emacs
    ./k9s
    ./spotifyd
    ./vscode
  ];

}
