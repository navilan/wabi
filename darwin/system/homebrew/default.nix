{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap"; # "zap" removes manually installed brews and casks
    };
    brews = [
      # "qmk"
      "libomp" # OpenMP
      "libusb"
      # "qemu"
      "skhd" # keybinding manager
      "sketchybar"
      "svim"
      "yabai" # tiling window manager
      "detox"
      "poetry"
      "stripe/stripe-cli/stripe"
      "telnet"
      "wrangler"
      "azure-cli"
      "azure-functions-core-tools@4"
    ];
    casks = [
      "adobe-creative-cloud"
      "sf-symbols"
      "alfred"
      "firefox"
      "chromium"
      "vivaldi"
      "jetbrains-toolbox"
      "kensingtonworks"
      "macfuse"
      "meld"
      "microsoft-excel"
      "microsoft-word"
      "the-unarchiver"
      "tunnelblick"
      "unity-hub"
      "utm"
      "vlc"
      "zoom"
      "slack"
      "qutebrowser"
      "spotify"
      "obs"
    ];
    taps = [
      "cmacrae/formulae" # spacebar
      "d12frosted/emacs-plus"
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae" # yabai
      "FelixKratz/formulae" # sketchy bar
      "qmk/qmk"
      "azure/functions"
    ];

    extraConfig = ''
      brew "emacs-plus@29", args: ["with-modern-black-dragon-icon", "with-mailutils", "with-xwidgets", "with-imagemagick", "with-dbus", "with-ctags"], link: true
    '';
    masApps = {
      Vimari = 1480933944;
      AdGuard = 1440147259;
      Tamperish = 1516885392;
      IcoonFly = 556381974;
    };
  };
}
