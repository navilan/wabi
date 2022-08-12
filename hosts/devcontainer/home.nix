

{ pkgs, ... }:
let commonPkgs = import ../../common/packages.nix { inherit pkgs; };
in
{
  imports = [
    ../../common
  ];

  home = {
    stateVersion = "22.05";
    username = "code";
    homeDirectory = "/home/code";

    packages = commonPkgs.packages;
    sessionVariables = {
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
