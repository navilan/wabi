{ config, lib, pkgs, ... }:
let inherit (pkgs.nur.repos.rycee) firefox-addons;
in {

  home.packages = with pkgs; [ buku bukubrow ];

  home.activation.ensureBukubrowHost =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD ${pkgs.bukubrow}/bin/bukubrow --install-firefox
      $DRY_RUN_CMD ${pkgs.bukubrow}/bin/bukubrow --install-chromium
    '';

}
