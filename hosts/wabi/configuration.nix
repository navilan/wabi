{ pkgs, user, inputs, ... }:

let
  stringTakeLast = str: last:
    let strLen = pkgs.lib.stringLength str;
    in pkgs.lib.substring (strLen - last) strLen str;
  buildApp = spec:
    let formats = [ "dmg" "pkg" "zip" ];
    in with spec;
    pkgs.stdenv.mkDerivation rec {
      inherit name version;
      fileType = let extName = stringTakeLast url 3;
      in if builtins.elem extName formats then
        extName
      else
        abort "Unsupported compression file types: ${extName}";
      src = pkgs.fetchurl {
        url = builtins.replaceStrings [ "{0}" "{1}" "{2}" ] [
          name
          version
          location
        ] url;
        sha256 = sha256;

        # https://discourse.nixos.org/t/how-to-change-the-user-agent-used-by-fetchurl/4987/2
        # https://github.com/Homebrew/homebrew-cask/blob/master/Casks/neteasemusic.rb
        curlOpts = "-A :fake";
      };

      nativeBuildInputs = [ pkgs.xar pkgs.cpio pkgs.p7zip ];
      # https://stackoverflow.com/questions/11298855/how-to-unpack-and-pack-pkg-file
      unpackPhase = if fileType == "dmg" then ''
        echo y | /usr/bin/hdiutil attach ${src}
        cd "/Volumes/${location}"
      '' else if fileType == "pkg" then ''
        xar -xf ${src} && cd ${location}
        cat Payload | gunzip -dc | cpio -i
      '' else if fileType == "zip" then
        "7z x ${src}"
      else
        abort "No implement compress format: ${fileType}";

      configurePhase = "echo";
      installPhase = ''
        mkdir -p $out/Applications/
        ls | grep ".app$" | head -n 1 | xargs -I {} cp -r {} $out/Applications/
      '';
    };
  fetched = import ./fetched.nix;
in {
  imports = [
    ../../common/system.nix
    ../../darwin/system
  ];
  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = map buildApp fetched ++ [ pkgs.cmake ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nixpkgs.overlays = [
    inputs.nur.overlays.default
    (final: prev: {
      # This populates a dummy package to satisfy the requirement (From Homebrew)
      firefox-darwin = final.runCommand "firefox-0.0.0" { } "mkdir $out";
    })
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nix.settings.allowed-users = [ "${user}" ];
  nix.package = pkgs.nixVersions.latest;

  users.users."${user}" = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

 # nix.configureBuildUsers = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  programs = { zsh.enable = true; };


  networking = {
    hostName = "wabi";
    computerName = "wabi";
  };

  fonts = {
    packages = with pkgs; [

      recursive
      (import ../../darwin/sketchybar/sketchybar-app-font.nix { inherit pkgs; })
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };


  system.stateVersion = 4;
}
