{ lib, inputs, pkgs, nixpkgs, home-manager, darwin, user, ... }:

let system = "aarch64-darwin";
in {
  wabi = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./configuration.nix
      ../../darwin/system/applications.nix

      home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} = import ./home.nix;
      }
    ];
  };
}
