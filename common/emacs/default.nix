{ config, pkgs, lib, ... }: {

  home.file.".doom.d/config.el".text = builtins.readFile ./doom.d/config.el;
  home.file.".doom.d/init.el".text = builtins.readFile ./doom.d/init.el;
  home.file.".doom.d/packages.el".text = builtins.readFile ./doom.d/packages.el;

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

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

}
