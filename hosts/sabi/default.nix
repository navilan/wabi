{ lib, inputs, pkgs, nixpkgs, home-manager, user, ... }:

let system = "aarch64-linux";
in {
  sabi = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ../../vms/hardware-configuration-aarch64-utm.nix
      ./configuration.nix
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
