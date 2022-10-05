{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap"; # "zap" removes manually installed brews and casks
    brews = [
      "libomp" # OpenMP
      "libusb"
      "qemu"
      "skhd" # keybinding manager
      "spacebar" # macos bar alternative
      "yabai" # tiling window manager
      "m-cli"
    ];
    casks = [
      "adobe-creative-cloud"
      "alfred"
      "chromium"
      "firefox"
      "jetbrains-toolbox"
      "kensingtonworks"
      "macfuse"
      "mactex"
      "meld"
      "microsoft-excel"
      "microsoft-word"
      "the-unarchiver"
      "tunnelblick"
      "ubersicht"
      "unity-hub"
      "utm"
      "vlc"
      "zoom"
    ];
    taps = [
      "cmacrae/formulae" # spacebar
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae" # yabai
    ];
    masApps = {
      Vimari = 1480933944;
      AdGuard = 1440147259;
      Tamperish = 1516885392;
    };
  };
}
