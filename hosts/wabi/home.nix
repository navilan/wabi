{ inputs, pkgs, ... }:
let
  commonPkgs = import ../../common/packages.nix { inherit pkgs; };
  wabiPkgs = with pkgs; [
    swiProlog
    flavours

    jdk11
    python3

    rustup

    nodejs
    nvm
    yarn

    portaudio
    spotify-tui

    lima
    gnuplot
    libusb1
    qrencode
    kitty
    toot

    (callPackage ../../common/wally-cli { })

  ];
in {
  imports = [
    ../../common
    ../../common/extra.nix
    ../../darwin
    ../../darwin/buku
    ../../darwin/home-manager/applications.nix
    ../../darwin/home-manager/chsh.nix
  ];

  home = {
    stateVersion = "22.05";

    packages = commonPkgs.packages ++ wabiPkgs;
    sessionPath = [
      "$HOME/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$HOME/.ddotnet/tools"
    ];
    sessionVariables = {
      TERMINFO_DIRS =
        "${pkgs.kitty.terminfo.outPath}/share/terminfo:$TERMINFO_DIRS";
      GO111MODULE = "on";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    direnv.enable = true;
    direnv.nix-direnv.enable = true;

    zoxide.enable = true;
    jq.enable = true;

    browserpass = {
      enable = true;
      browsers = [ "firefox" "chromium" ];
    };

    password-store = { enable = true; };

    lsd = {
      enable = true;
      enableAliases = true;
    };

    bat = { enable = true; };

    lazygit = { enable = true; };

    go = {
      enable = true;
      package = pkgs.go_1_22;
      goPath = "go";
      goBin = "go/bin";
      goPrivate = [ "github.com/stackitcloud" ];
    };

    htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_frequency = true;
        show_cpu_usage = true;
        show_program_path = false;
      };
    };

    fzf = {
      enable = true;
      defaultCommand =
        "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
        "--bind ctrl-h:preview-down,ctrl-l:preview-up"
      ];
    };
  };
}
