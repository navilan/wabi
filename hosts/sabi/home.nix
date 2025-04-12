{ pkgs, user, inputs, ... }:
let commonPkgs = import ../../common/packages.nix { inherit pkgs; };
in {
  imports =
    [ ../../common ../../common/kitty ./common/vscode ../../common/emacs ];

  home = {
    stateVersion = "22.05";
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = commonPkgs.packages ++ [ pkgs.rofi ];

    # Make cursor not tiny on HiDPI screens
    pointerCursor = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
      size = 96;
      x11.enable = true;
    };

    sessionPath = [ "$HOME/go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" ];
    sessionVariables = {
      GO111MODULE = "on";
      EDITOR = "nvim";
      VISUAL = "nvim";
      LANG = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      PAGER = "less -FirSwX";
      MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    };
  };

  xdg.enable = true;
  xdg.configFile."i3/config".text = builtins.readFile ../../nixos/i3/i3rc;
  xdg.configFile."i3/config.rasi".text =
    builtins.readFile ../../nixos/rofi/rofirc;

  xdg.configFile."devtty/config".text =
    builtins.readFile ../../nixos/devtty/devttyrc;

  services.emacs = { enable = true; };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";

    # cache the keys forever so we don't get asked for a password
    defaultCacheTtl = 31536000;
    maxCacheTtl = 31536000;
  };

  xresources.extraConfig = builtins.readFile ../../nixos/X/Xresources;

  programs = {
    home-manager.enable = true;
    gpg.enable = true;

    direnv.enable = true;
    direnv.nix-direnv.enable = true;

    zoxide.enable = true;
    jq.enable = true;

    lsd = {
      enable = true;
      enableAliases = true;
    };

    bat = { enable = true; };

    lazygit = { enable = true; };

    i3status = {
      enable = true;

      general = {
        colors = true;
        color_good = "#8C9440";
        color_bad = "#A54242";
        color_degraded = "#DE935F";
      };

      modules = {
        ipv6.enable = false;
        "wireless _first_".enable = false;
        "battery all".enable = false;
      };
    };

    go = {
      enable = true;
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
