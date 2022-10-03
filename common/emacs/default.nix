{ config, pkgs, lib, ... }:

let p = import ../../lib/platforms.nix { inherit config pkgs; };
in {

  home.file = { ".doom.d" = { source = p.mkSource ./doom.d; }; };

  home.activation.doomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    DOOM="$HOME/.emacs.d"
    if [ ! -d "$DOOM" ]; then
      echo "cloning doom emacs"
      git clone https://github.com/doomemacs/doomemacs.git $DOOM
      yes | $DOOM/bin/doom install
      $DOOM/bin/doom sync
    else
      $DOOM/bin/doom sync
    fi
  '';

  programs.emacs = { enable = true; };

}
