{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "wally-cli-2.0.1";
  src = pkgs.fetchurl {
    url = "https://github.com/zsa/wally-cli/releases/download/2.0.1-osx/wally-cli";
    sha256 = "sha256-HD2kkvzegrRZo9cHvr+aTckBYUiwGdFa8AqYzOiEfvU=";
  };
  dontStrip = true;
  unpackPhase = ''
    cp $src ./wally-cli
  '';
  installPhase = ''
    mkdir -p $out/bin
    chmod +wx wally-cli
    cp wally-cli $out/bin
   '';
}
