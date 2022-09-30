{ inputs, config, pkgs, lib, ... }:
let
  configPath = if pkgs.stdenv.hostPlatform.isDarwin then
    "Library/Application Support"
  else
    ".config";
in {
  home = {
    file = {
      "${configPath}/Code/User/settings.json".text =
        builtins.readFile ./settings.json;
      "${configPath}/Code/User/keybindings.json".text =
        builtins.readFile ./keybindings.json;
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
