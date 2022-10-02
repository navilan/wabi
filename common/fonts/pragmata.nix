{ pkgs, ... }:

let
  stdenv = pkgs.stdenvNoCC;
  lib = pkgs.lib;
  fetchZip = pkgs.fetchZip;

in stdenv.mkDerivation rec {
  pname = "pragmatapro-${version}";
  dontConfigure = true;
  version = "0.829";

  src = pkgs.requireFile rec {
    name = "PragmataPro-${version}.zip";
    sha256 = "0gpf4r45451204vr18f3cqz559n0hi92nfqflcdqzf59apl66p9f";
    message = "Run $  nix-store --add-fixed sha256 <file>";
  };

  buildInputs = [pkgs.unzip];
  phases  = [ "unpackPhase" "installPhase" ];
  sourceRoot = ".";
  installPhase = ''
    install_path=$out/share/fonts/opentype
    mkdir -p $install_path
    find -name "*.otf" -exec     cp {} $install_path \;
  '';

  meta = { description = "Pragmata Pro by Fabrizio (fsd.it)"; };
}
