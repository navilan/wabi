{ lib, inputs, pkgs, nixpkgs, home, user, ... }:

let
  system = "aarch64-linux";
in {
  sabi = nixpkgs.lib.nixosSystem rec {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      {
        imports = [ inputs.sops-nix.nixosModules.sops ];
      }
      ./hardware-configuration.nix
      ./configuration.nix
      home.nixosModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} = import ./home.nix;
      }
    ];
  };
}
