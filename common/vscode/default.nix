{ config, pkgs, lib, ... }: {
  home = {

    file = {
      "Library/Application Support/VSCodium/User/settings.json" = {
        source = config.lib.file.mkOutOfStoreSymlink ./settings.json;
      };
      "Library/Application Support/VSCodium/User/keybindings.json" = {
        source = ./keybindings.json;
      };
    };
  };
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = import ./extensions.nix {
        inherit config;
        inherit pkgs;
      };
    };
  };
}
