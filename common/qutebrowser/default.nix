{ config, lib, pkgs, ... }:
let inherit (builtins) readFile;
in

{
  home.file.".qutebrowser/config.py".text = ''
    ${readFile ./settings.py}
    ${readFile ./font.config.py}
    ${readFile ./themes/b16-tokyo-night.config.py}
  '';
}
