{ pkgs, ... }:

let
  stdenv = pkgs.stdenvNoCC;
  lib = pkgs.lib;
  fetchurl = pkgs.fetchurl;
in stdenv.mkDerivation rec {
  pname = "sf-symbols";
  version = "4";

  src = fetchurl {
    url =
      "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-${version}.dmg";
    sha256 = "sha256-UxWePkoIH9wLPPS8MuzNBXy2sBNJis/u9MiqkGm0tuY=";

  };

  sourceRoot = ".";
  buildInputs = with pkgs; [ undmg xar cpio ];
  installPhase = ''
    xar -Oxf SF\ Symbols.pkg SFSymbols.pkg/Payload | gzip -d | cpio -i
    mkdir -p $out/share/fonts/truetype
    cp ./Library/Fonts/*.ttf $out/share/fonts/truetype
  '';

  meta = {
    description = "Fonts from SF Symbols";
    homepage = "https://developer.apple.com/sf-symbols/";
    platforms = lib.platforms.all;
  };
}
