{ config, lib, inputs, nixpkgs, home-manager, darwin, user, ... }:

let
  system = "aarch64-darwin";
  pkgs = import inputs.nixpkgs {
    inherit system;
    nixpkgs.config.allowUnfree = true;
  };
  lib = pkgs.lib;
in {
  wabi = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit pkgs user inputs; };
    modules = [
      ./configuration.nix
      ../../darwin/system/applications.nix

      home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} =
          import ./home.nix { inherit pkgs inputs lib config; };
      }
    ];
  };
}
