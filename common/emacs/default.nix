{ config, pkgs, lib, ... }:

let p = import ../../lib/platforms.nix { inherit pkgs config; };
in {

  home.file = { ".doom.d" = { source = p.mkSource ./doom.d; }; };

  home.activation.doomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
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
}
