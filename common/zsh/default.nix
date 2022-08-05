{ config, pkgs, lib, ... }: {
  home.file.starship = {
    target = ".config/starship.toml";
    text = ''
      #add_newline = false

      [character]
      success_symbol = "[➜](bold green) "
      error_symbol = "[✗](bold red) "
    '';
  };

  home.activation.chshzsh = lib.hm.dag.entryAfter ["writeBoundary"]
    ''
    sudo chsh -s ${pkgs.zsh}/bin/zsh
    '';


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    # TODO reenable when issue is fixed
    # https://github.com/NixOS/nix/issues/5445
    enableCompletion = false;
    autocd = true;
    dotDir = ".config/zsh";
    defaultKeymap = "viins"; #vicmd or viins

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true; # ignore commands starting with a space
      save = 20000;
      size = 20000;
      share = true;
    };

    initExtraBeforeCompInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
        eval "$(${pkgs.starship}/bin/starship init zsh)"
        eval "$(${pkgs.thefuck}/bin/thefuck --alias)"
      '';

    initExtra = ''
      # TODO only because session variables are not getting picked up
      export EDITOR=nvim
      export VISUAL=nvim
      export NIXPKGS_ALLOW_UNFREE=1
      export ETCD_UNSUPPORTED_ARCH=arm64

      bindkey '^e' edit-command-line
      bindkey '^ ' autosuggest-accept
      bindkey '^k' up-line-or-search
      bindkey '^j' down-line-or-search

      bindkey '^r' fzf-history-widget
      bindkey '^f' fzf-file-widget

      function cd() {
          builtin cd $*
          lsd
      }

      function mkd() {
          mkdir $1
          builtin cd $1
      }

      function take() { builtin cd $(mktemp -d) }
      function vit() { nvim $(mktemp) }

      function lgc() { git commit --signoff -m "$*" }

      function clone() { git clone git@$1.git }

      function gclone() { clone github.com:$1 }


      function gsm() { git submodule foreach "$* || :" }

      function lg() {
          git add --all
          git commit --signoff -a -m "$*"
          git push
      }

      function dci() { docker inspect $(docker-compose ps -q $1) }

      # direnv
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"

      export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L$(brew --prefix libpq)/lib -L$(brew --prefix libffi)/lib"
      export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I$(brew --prefix libpq)/include -I$(brew --prefix libffi)/include"
    '';

    # dirHashes = {
    #   dl = "$HOME/Downloads";
    #   nix = "$HOME/.nixpkgs";
    #   work = "$HOME/work";
    # };

    shellAliases = {
      # builtins
      size = "du -sh";
      cp = "cp -i";
      mkdir = "mkdir -p";
      df = "df -h";
      free = "free -h";
      du = "du -sh";
      susu = "sudo su";
      op = "xdg-open";
      del = "rm -rf";
      sdel = "sudo rm -rf";
      lst = "ls --tree -I .git";
      lsl = "ls -l";
      lsa = "ls -a";
      null = "/dev/null";
      tmux = "tmux -u";
      tu = "tmux -u";
      tua = "tmux a -t";

      # overrides
      cat = "bat";
      ssh = "TERM=screen ssh";
      python = "python3";
      pip = "python3 -m pip";
      venv = "python3 -m venv";
      j = "z";

      # utilities
      psf = "ps -aux | grep";
      lsf = "ls | grep";
      search = "sudo fd . '/' | grep"; # TODO replace with ripgrep
      shut = "sudo shutdown -h now";
      tssh = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      socks = "ssh -D 1337 -q -C -N";


      # nix
      ne = "nvim -c ':cd ~/.nixpkgs' ~/.nixpkgs";
      nb = "darwin-rebuild switch";
      nbu = "nix-channel --update && darwin-rebuild switch";
      #clean = "rm -rf ~/.Trash/* && nix-collect-garbage"; # TODO empty bin
      clean = "nix-collect-garbage";
      nsh = "nix-shell";
      "," = "nix-shell -p";

      nbh = "home-manager switch";
      nbhu = "nix-channel --update && home-manager switch";

    };

    plugins = [
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
    ];
    prezto = {
      enable = true;
      caseSensitive = false;
      utility.safeOps = true;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      #prompt.showReturnVal = true;
      #tmux.autoStartLocal = true;
      pmodules = [
        "autosuggestions"
        "completion"
        "directory"
        "editor"
        "git"
        "terminal"
      ];
    };
  };
}

