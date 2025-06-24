{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      upgrade = true;
      autoUpdate = true;
    };
    brews = [
      "azure-cli"
      "azure-functions-core-tools@4"
      "cocoapods"
      "docker-compose"
      "fastlane"
      "ghcup"
      "haskell-stack"
      "helm"
      "istioctl"
      "k3d"
      "kubectl"
      "kustomize"
      "nvm"
      "pnpm"
      "poetry"
      "qmk"
      "rust"
      "pass"
      "skaffold"
      "sketchybar"
      "skhd" # keybinding manager
      "stripe/stripe-cli/stripe"
      "svim"
      "telnet"
      "terminal-notifier"
      "uv"
      "wrangler"
      "yabai" # tiling window manager
      "yarn"
      # "detox"
      # "libomp" # OpenMP
      # "libusb"
      # "qemu"
    ];
    casks = [
      "adobe-creative-cloud"
      "alfred"
      "android-studio"
      "chromium"
      "firefox"
      "jetbrains-toolbox"
      "macfuse"
      "meld"
      "microsoft-excel"
      "microsoft-word"
      "obs"
      "qutebrowser"
      "sf-symbols"
      "slack"
      "spotify"
      "the-unarchiver"
      "tunnelblick"
      "unity-hub"
      "utm"
      "visual-studio-code-insiders"
      "vivaldi"
      "vlc"
      "zoom"
#      "android-platform-tools"
    ];
    taps = [
      # "homebrew/cask"
      # "osx-cross/avr"
      "osx-cross/arm"
      "cmacrae/formulae" # spacebar
      "d12frosted/emacs-plus"
      "homebrew/bundle"
      "homebrew/cask-drivers"
      "homebrew/cask-versions"
      "homebrew/services"
      "koekeishiya/formulae" # yabai
      "FelixKratz/formulae" # sketchy bar
      # "qmk/qmk"
      "azure/functions"
    ];

    extraConfig = ''
      brew "emacs-plus@29", args: ["with-modern-black-dragon-icon", "with-mailutils", "with-xwidgets", "with-imagemagick", "with-dbus", "with-ctags"], link: true
    '';
    masApps = {
      Vimari = 1480933944;
      AdGuard = 1440147259;
      Tamperish = 1516885392;
      IconFly = 556381974;
    };
  };
}
