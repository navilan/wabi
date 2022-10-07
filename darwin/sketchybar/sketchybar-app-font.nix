{ pkgs, ... }:

let
  stdenv = pkgs.stdenvNoCC;
  lib = pkgs.lib;
  fetchZip = pkgs.fetchZip;

in stdenv.mkDerivation rec {
  pname = "sketchybar-app-font";
  dontConfigure = true;
  version = "1.0.3";

  src = pkgs.fetchurl rec {
    name = "${pname}-${version}.ttf";
    url =
      "https://github.com/kvndrsslr/${pname}/releases/download/v${version}/${pname}.ttf";
    sha256 = "sha256-iv3Th/lVL0ngJGE44m0jzSPsApe8LOq+fxqHncHGwOU=";
  };

  phases = [ "unpackPhase" "installPhase" ];

  sourceRoot = "./";
  unpackCmd = ''
    echo $curSrc
    ttfName=$(basename $(stripHash $curSrc))
    echo "ttfname: $ttfName"
    cp $curSrc ./$ttfName
  '';

  installPhase = ''
    install_path=$out/share/fonts/truetype/sketchy-bar-app-font.ttf
    mkdir -p $install_path
    ls -al *.ttf
    echo copying font
    cp *.ttf $install_path
    echo Font ready
  '';

  meta = { description = "Sketchy Bar App Font (kvndrsslr)"; };
}
