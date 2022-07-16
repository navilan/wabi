{ config, pkgs, lib, ... }: {
  home.file = {
    ".bin" = {
      source = ./bin;
    };
  };
}