{ pkgs, ... }:

{
  packages = with pkgs; [
    bottom
    fd
    ripgrep
    zx
    git
    git-lfs
    ranger
    shellcheck
    gitAndTools.delta
    wget
    curl
    cloc
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
    ispell
    nixfmt
    keychain
    neofetch
    rename
    pinentry-emacs
    jless
    gdal

    coreutils-full
    gnutar
    gnused
    gnugrep
    gnumake
    findutils
    gawk
    starship
  ];
}
