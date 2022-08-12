{ pkgs, ... }:

{
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

      coreutils-full
      gnutar gnused gnugrep gnumake
      findutils
      gawk
      starship
    ];
}
