{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap"; # "zap" removes manually installed brews and casks
    brews = [
      "helm"
      "lima" # docker alternative
      "zlib" # dependency for emacs

      "libpq"
      "libgccjit"
      "gcc"
      # waiting for updates on nix
      #
      #
      #
      "spacebar" # macos bar alternative
      "skhd" # keybinding manager
      # broken nix builds
      "yabai" # tiling window manager
    ];
    casks = [
      # utilities
      "macfuse" # file system utilities
      "alfred" # launcher

      "adobe-creative-cloud"
      "balenaetcher"
      "chromium"
      "firefox"
      "meld" # folder differ
      "the-unarchiver"
      "tunnelblick" # vpn client
      "ubersicht"
      "unity-hub"
      "microsoft-word"
      "microsoft-excel"
      "slack"
      "zoom"

      "jetbrains-toolbox"
      "ibm-cloud-cli"

      "kensingtonworks"
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
      "d12frosted/emacs-plus"
      "jakehilborn/jakehilborn"
    ];
    masApps = {
      Vimari = 1480933944;
      # AdGuard = 1440147259;
      Monday = 1298450641;
      Fantastical = 975937182;
      Tamperish = 1516885392;
    };
  };
}
