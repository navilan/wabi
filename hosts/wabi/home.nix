
{ config, pkgs, lib, ... }: 
{
  imports = [
    ../../common
    ../../darwin
  ];

  home = {
    stateVersion = "21.11";
    packages = with pkgs; [
      # terminal
      bottom # htop alternatives
      #btop
      fd ripgrep # fast search
      git
      git-lfs
      nnn #filemanager
      shellcheck # Shell script linter
      gitAndTools.delta # pretty diff tool
      wget curl
      thefuck # auto correct commands
      sshfs # mount folders via ssh
      gh # github cli tool
      direnv # Autoload env
      # TODO m1 mac ttyd # terminal share via web
      graph-easy # draw graphs in the terminal
      unixtools.watch # watches commands
      cht-sh # cheat sheet -> cht python read file
      tealdeer # community driven man pages
      dive # analyse docker images
      hyperfine # benchmark tool
      sipcalc # ip subnet calculator
      duf # disk usage
      httpie # awesome alternative to curl
      tmuxp
      gnupg
      gnutls

      swiProlog #prolog
      jdk11 #Java

      # gnu binaries
      coreutils-full # installs some gnu versions of linux bins
      gnutar gnused gnugrep gnumake # linux implementation of tar
      findutils
      gawk

      # k8s stuff
      kubectl k9s kubie

      #podman # TODO installed via brew - cannot be installed via nix right now

      python37 poetry # python tools
      rustup # rust
      nodejs # node runtime
      yarn

      starship # terminal prompt


      # music
      portaudio
      spotify-tui
      spotifyd

      # social
      teams



      (pkgs.writeShellScriptBin "nixFlakes" ''
        exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
      '')

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
    # let home-manager manage itself
    home-manager.enable = true;

    # shell integrations are enabled by default
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
