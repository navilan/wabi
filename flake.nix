{
  description = "Wabi Systems";


  nixConfig.extra-experimental-features = "nix-command flakes";
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    

    darwin = {
      url = github:lnl7/nix-darwin/master;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs = {
      url = "github:cmacrae/emacs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
    };
  };

  outputs = { self, nixpkgs, darwin, home, ...}@inputs:
    let 
      pkgs = nixpkgs;
      home-manager = home.darwinModules.home-manager;
    in
    {
      devContainers = let user = "code"; in (
        import ./hosts/devcontainer {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home user;
        }
      );
      darwinConfigurations = let user = "navilan"; in (
        import ./hosts/wabi {
          inherit (nixpkgs) lib;
          inherit inputs pkgs nixpkgs darwin home-manager user;
        }
      );
    };
}
