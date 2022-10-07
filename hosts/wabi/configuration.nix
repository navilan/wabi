{ pkgs, user, ... }:

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
    ../../common/spotifyd/system.nix
    ../../darwin/system
  ];
  environment = {
    loginShell = pkgs.zsh;
    shells = with pkgs; [ zsh ];
    systemPackages = map buildApp fetched ++ [ pkgs.cmake ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  nix.settings.allowed-users = [ "${user}" ];
  nix.package = pkgs.nixUnstable;

  users.users."${user}" = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  nix.configureBuildUsers = true;

  security.pam.enableSudoTouchIdAuth = true;

  programs = { zsh.enable = true; };

  services.nix-daemon = { enable = true; };

  networking = {
    hostName = "wabi";
    computerName = "wabi";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      # emacs-all-the-icons-fonts
      nerdfonts
      recursive
      (import ../../darwin/sketchybar/sketchybar-app-font.nix { inherit pkgs; })
      (import ../../darwin/sketchybar/sf-symbols.nix { inherit pkgs; })
    ];
  };

  system.stateVersion = 4;
}
