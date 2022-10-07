{
  description = "Wabi Systems";

  nixConfig.extra-experimental-features = "nix-command flakes";
  inputs = {
    flake-utils = { url = "github:numtide/flake-utils"; };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur = { url = "github:nix-community/NUR"; };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs = {
      url = "github:cmacrae/emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy = {
      url = "github:input-output-hk/deploy-rs";
      inputs.nixpkgs.follows = "fenix/nixpkgs";
      inputs.fenix.follows = "fenix";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wally-cli = {
      url = "github:zsa/wally-cli";
      flake = false;
    };
  };

  outputs =
    { self, nixpkgs, darwin, home, sops-nix, deploy, flake-utils, ... }@inputs:
    let
      shells = flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          dep = with pkgs;
            callPackage ./shell.nix {
              inherit (sops-nix.packages."${pkgs.system}")
                sops-import-keys-hook ssh-to-pgp sops-init-gpg-key;
              inherit (deploy.packages."${pkgs.system}") deploy-rs;
            };
        in {
          devShells = rec { inherit dep; };
          devShell = dep;
        });
      pkgs = nixpkgs;
    in with shells; {
      inherit devShells devShell;
      devContainers = let user = "code";
      in (import ./hosts/devcontainer {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home user;
      });
      darwinConfigurations = let
        user = "navilan";
        home-manager = home.darwinModules.home-manager;
      in (import ./hosts/wabi {
        inherit (nixpkgs) lib;
        inherit inputs pkgs nixpkgs darwin home-manager user;
      });
      nixosConfigurations = let
        user = "navilan";
        home-manager = home;
      in (import ./hosts/sabi {
        inherit (nixpkgs) lib;
        inherit inputs pkgs nixpkgs home user;
      });

      deploy = import ./hosts/deploy.nix (inputs // { inherit inputs; });
    };
}
