{ lib, inputs, nixpkgs, home, user, ...}:
let system = "x86_64-linux";
    in
    {
      dc = home.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
          ];
          extraSpecialArgs = { inherit user inputs; };
      };
    }
