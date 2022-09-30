{ config, lib, pkgs, ... }:

{

  home.activation.chshzsh = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    sudo chsh -s ${pkgs.zsh}/bin/zsh
  '';
}
