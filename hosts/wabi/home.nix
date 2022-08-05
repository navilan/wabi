
{ pkgs, ... }: 
{
  imports = [
    ../../common
    ../../darwin
  ];

  home = {
    stateVersion = "22.05";

    packages = with pkgs; [
      bottom
      fd ripgrep
      git
      git-lfs
      ranger
      shellcheck
      gitAndTools.delta
      wget curl
      thefuck
      sshfs
      gh
      direnv
      graph-easy
      duf
      httpie
      tmuxp
      gnupg
      gnutls

      swiProlog
      jdk11

      coreutils-full
      gnutar gnused gnugrep gnumake
      findutils
      gawk

      kubectl k9s kubie

      python37 poetry
      rustup
      nodejs
      yarn

      starship

      portaudio
      spotify-tui
    ];
    sessionPath = [
      "$HOME/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    sessionVariables = {
      GO111MODULE = "on";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;

    zoxide.enable = true;
    jq.enable = true;

    lsd = {
      enable = true;
      enableAliases = true;
    };

    bat = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    go = {
      enable = true;
      package = pkgs.go_1_18;
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
      defaultCommand = "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
        "--bind ctrl-h:preview-down,ctrl-l:preview-up"
      ];
    };
  };
}
