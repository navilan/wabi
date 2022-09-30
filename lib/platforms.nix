{ config, pkgs, ... }: rec {

  whenDarwinOrElse = x: y: if pkgs.stdenv.hostPlatform.isDarwin then x else y;

  mkSource = source:
    whenDarwinOrElse (config.lib.file.mkOutOfStoreSymlink source) source;
}
