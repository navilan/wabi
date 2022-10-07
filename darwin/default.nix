{ config, pkgs, lib, ... }: {
  imports = [ ./adblock ./scripts ./skhd ./spacebar ./sketchybar ./yabai ];
}
