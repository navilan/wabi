{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap"; # "zap" removes manually installed brews and casks
    brews = [
      # waiting for updates on nix
      #
      #
      #
      "spacebar" # macos bar alternative
      "skhd" # keybinding manager
      "yabai" # tiling window manager
      "libomp" # OpenMP
      "libusb"
    ];
    casks = [
      "macfuse"
      "alfred"
      "adobe-creative-cloud"
      "chromium"
      "firefox"
      "meld"
      "the-unarchiver"
      "tunnelblick"
      "ubersicht"
      "unity-hub"
      "microsoft-word"
      "microsoft-excel"
      "zoom"
      "jetbrains-toolbox"
      "kensingtonworks"
      "mactex"
      "vlc"
    ];
    taps = [
      "cmacrae/formulae" # spacebar
      "koekeishiya/formulae" # yabai

      # default
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
      "homebrew/services"
    ];
    masApps = {
      # Vimari = 1480933944;
      # AdGuard = 1440147259;
      # Monday = 1298450641;
      # Fantastical = 975937182;
      # Tamperish = 1516885392;
    };
  };
}
