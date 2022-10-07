{ config, pkgs, lib, ... }: {
  home = {

    file = {
      "Library/Application Support/VSCodium/User/settings.json" = {
        source = config.lib.file.mkOutOfStoreSymlink .../vscode/settings.json;
      };
      "Library/Application Support/VSCodium/User/keybindings.json" = {
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
