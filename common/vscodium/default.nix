{ config, pkgs, lib, ... }:
let
  p = import ../../lib/platforms.nix { inherit config pkgs; };
  configPath = p.whenDarwinOrElse "Library/Application Support" ".config";
in {

  home = {
    file = {
      "${configPath}/VSCodium/User/settings.json" = {
        source = ../vscode/settings.json;
      };
      "${configPath}/VSCodium/User/keybindings.json" = {
        source = ../vscode/keybindings.json;
      };
    };
  };
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = import ../vscode/extensions.nix {
        inherit config;
        inherit pkgs;
        installClosed = false;
      };
    };
  };
}
