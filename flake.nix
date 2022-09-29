{
  description = "Wabi Systems";

  nixConfig.extra-experimental-features = "nix-command flakes";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs = { url = "github:cmacrae/emacs"; };
    emacs-overlay = { url = "github:nix-community/emacs-overlay"; };
    conda-x86_64-darwin = {
      url =
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh";
      flake = false;
    };
    conda-aarch64-darwin = {
      url =
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh";
      flake = false;
    };
    conda-x86_64-linux = {
      url =
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh";
      flake = false;
    };
    conda-aarch64-linux = {
      url =
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh";
      flake = false;
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

  outputs = { self, nixpkgs, darwin, home, ... }@inputs:
    let
      home-manager = home.darwinModules.home-manager;
      pkgs = nixpkgs;
    in {
      devContainers = let user = "code";
      in (import ./hosts/devcontainer {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home user;
      });
      darwinConfigurations = let user = "navilan";
      in (import ./hosts/wabi {
        inherit (nixpkgs) lib;
        inherit inputs pkgs nixpkgs darwin home-manager user;
      });
    };
}
