{ pkgs, zipurl, ... }:

let
  stdenv = pkgs.stdenvNoCC;
  lib = pkgs.lib;
  fetchZip = pkgs.fetchZip;

in stdenv.mkDerivation rec {
  pname = "pragmata-pro";
  dontConfigure = true;
  version = "0.829";

  src = pkgs.fetchzip {
    url = zipurl;
    sha256 = "sha256-uRRZ5nNUg0MyK2ZRCZeAYi2P2UHyxUHFNTzgnU+I8gY=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts;
    cp -R $src $out/share/fonts/opentype/
    runHook postInstall
  '';

  meta = { description = "Pragmata Pro by Fabrizio (fsd.it)"; };
}
