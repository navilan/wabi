{ inputs, config, pkgs, lib, ... }:
let
  p = import ../../lib/platforms.nix { inherit config pkgs; };
  configPath = p.whenDarwinOrElse "Library/Application Support" ".config";
in {
  home = {
    file = {
      "${configPath}/Code/User/settings.json" = { source = ./settings.json; };
      "${configPath}/Code/User/keybindings.json" = {
        source = ./keybindings.json;
      };
    };
  };
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = import ./extensions.nix {
        inherit config;
        inherit pkgs;
      };
    };
  };
}
