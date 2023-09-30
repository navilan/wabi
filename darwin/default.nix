{ config, pkgs, lib, ... }: {
  imports = [ ./adblock ./scripts ./skhd ./sketchybar ./yabai ./kitty ];
}
