{ config, pkgs, installClosed, ... }:
(with pkgs.vscode-extensions; [
  # Editor
  bodil.file-browser
  editorconfig.editorconfig
  kamikillerto.vscode-colorize
  mikestead.dotenv
  oderwat.indent-rainbow
  pkief.material-icon-theme
  streetsidesoftware.code-spell-checker
  vscodevim.vim
  vspacecode.vspacecode
  vspacecode.whichkey
  xyz.local-history

  # Git / Github
  eamodio.gitlens
  kahole.magit

  # Languages

  ## Graphql
  graphql.vscode-graphql

  ## Haskell
  haskell.haskell
  justusadam.language-haskell

  ## Nix
  bbenoist.nix
  b4dm4n.vscode-nixpkgs-fmt
  brettm12345.nixfmt-vscode
  jnoortheen.nix-ide

  ## Flix

  ## Prolog

  ## Markup & Data
  davidanson.vscode-markdownlint
  redhat.vscode-yaml
  tamasfe.even-better-toml
  yzhang.markdown-all-in-one

  ## Shell
  foxundermoon.shell-format
  timonwong.shellcheck

  ## Apps
  humao.rest-client

  ## Web (JS / TS / HTML / CSS)
  bradlc.vscode-tailwindcss
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  kamikillerto.vscode-colorize

  #
  #

]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace
(import ./marketplace-exts.nix)
++ pkgs.lib.optionals installClosed (import ./ms-exts.nix)
