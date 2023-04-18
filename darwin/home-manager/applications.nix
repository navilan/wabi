# https://raw.githubusercontent.com/IvarWithoutBones/dotfiles/main/home-manager/modules/darwin/applications.nix
{ config, lib, pkgs, ... }:

let
  apps = pkgs.buildEnv {
    name = "home-manager-applications";
    paths = config.home.packages;
    pathsToLink = "/Applications";
  };
in {
  # Home-manager does not link installed applications to the user environment. This means apps will not show up
  # in spotlight, and when launched through the dock they come with a terminal window. This is a workaround.
  # Upstream issue: https://github.com/nix-community/home-manager/issues/1341
  # home.activation.addApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   baseDir="$HOME/Applications/Home Manager Apps"
  #   if [ -d "$baseDir" ]; then
  #     rm -rf "$baseDir"
  #   fi
  #   mkdir -p "$baseDir"
  #   for appFile in ${apps}/Applications/*; do
  #     target="$baseDir/$(basename "$appFile")"
  #     $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
  #     $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
  #   done  '';
}
