{ config, pkgs, lib, ... }: {
  home.file = {
    ".config/kitty/session-kood" = {
      source = config.lib.file.mkOutOfStoreSymlink ./session-kood;
    };
    ".config/kitty/session-yabai" = {
      source = config.lib.file.mkOutOfStoreSymlink ./session-yabai;
    };
  };
}
