{ config, pkgs, lib, ... }: {
  home = {

    file = {
      "Library/Application Support/Code/User/settings.json" = {
        source = config.lib.file.mkOutOfStoreSymlink ./settings.json;
      };
      "Library/Application Support/Code/User/keybindings.json" = {
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
