{ config, pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "navilan@folds.in";
    userName = "navilan";
    aliases = {
      aa = "add --all";
      ap = "iadd --patch";
      branches = "for-each-ref --sort=-committerdate --format=\"%(color:blue)%(authordate:relative)\t%(color:red)%(authorname)\t%(color:white)%(color:bold)%(refname:short)\" refs/remotes";
      ci = "commit -v";
      co = "checkout";
      pf = "push --force-with-lease";
      st = "status";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      push = {
        default = "current";
      };
      color = {
        ui = "auto";
      };
      core = {
        excludesfile = "~/.config/git/ignore";
        autocrlf = "input";
      };
      merge = {
        ff = "only";
      };
      commit = {
        template = "~/.config/git/message";
      };
      pull = {
        ff = "only";
      };
      fetch = {
        prune = "true";
      };
      rebase = {
        autosquash = "true";
      };
      include = {
        path = "~/.config/git/local";
      };
      delta = {
        line-numbers = true;
      };
      "filter \"lfs\"" = {
        required = true;
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";

      };
    };
  };

  home.file = {
    ".config/git/ignore" = {
      source = ./config/ignore;
    };

    ".config/git/message" = {
      source = ./config/message;
    };
  };
}
