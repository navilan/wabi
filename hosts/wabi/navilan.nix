{ config, pkgs, lib, ... }:
let home-manager = builtins.fetchGit {
  url = "https://github.com/rycee/home-manager.git";
};
in
{
  imports = [
    (import "${home-manager}/nix-darwin")
  ];
  users.users.navilan = {
    home = "/Users/navilan";
    shell = pkgs.zsh;
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.navilan = ./home.nix;
  };

}