{ config, pkgs, modulesPath, user, ... }: {
  # Qemu
  services.spice-vdagentd.enable = true;

  # Lots of stuff that uses aarch64 that claims doesn't work, but actually works.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  users.users."${user}" = {
    isNormalUser = true;
    home = "/home/${user}";
    extraGroups = [ "docker" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7VjBWlX1sUjKNkERluCGyL45sKIoGiivm5ASND1RTE navilan@puthir.in"
    ];
    hashedPassword =
      "$6$l.s6mk.OIYtRwDIw$pYHFTBXBEQyyDDuYZfSNZhxs5Kb1RHk8kP8XkNWRHtfGD4O8M.HImMYhKrRBsueUuEygVUcPJzw36hVPYfJR71";
    shell = pkgs.zsh;
  };

  networking = {
    hostName = "sabi";
    # Interface is this on my M1
    interfaces.enp0s6.useDHCP = true;
    # Disable the firewall since we're in a VM and we want to make it
    # easy to visit stuff in here. We only use NAT networking anyways.
    firewall.enable = false;
  };

  # https://github.com/nix-community/home-manager/issues/3247
  systemd.services."home-manager-${user}".serviceConfig.TimeoutStartSec =
    pkgs.lib.mkForce 3600;

  # Be careful updating this.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "0";
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };

  environment = {

    # For now, we need this since hardware acceleration does not work.
    variables.LIBGL_ALWAYS_SOFTWARE = "1";
    systemPackages = with pkgs; [
      cachix
      gnumake
      killall
      rxvt_unicode
      xclip

      # For hypervisors that support auto-resizing, this script forces it.
      # I've noticed not everyone listens to the udev events so this is a hack.
      (writeShellScriptBin "xrandr-auto" ''
        xrandr --output Virtual-1 --auto
      '')

    ];
  };

  nix = {
    package = pkgs.nixUnstable;
    settings = { allowed-users = [ "${user}" ]; };
    # use unstable nix so we can access flakes
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # We expect to run the VM on hidpi machines.
  hardware.video.hidpi.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Calcutta";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  #
  networking.useDHCP = false;

  # Don't require password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Virtualization settings
  virtualisation.docker.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # setup windowing environment
  services.xserver = {
    enable = true;
    layout = "us";
    dpi = 220;

    desktopManager = {
      xterm.enable = false;
      wallpaper.mode = "fill";
    };

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;

      # AARCH64: For now, on Apple Silicon, we must manually set the
      # display resolution. This is a known issue with VMware Fusion.
      sessionCommands = ''
        ${pkgs.xorg.xset}/bin/xset r rate 200 40
      '';
    };

    windowManager = { i3.enable = true; };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;

  # Manage fonts. We pull these from a secret directory since most of these
  # fonts require a purchase.
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs;
      [
        fira-code

      ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh = {
    passwordAuthentication = true;
    permitRootLogin = "no";
    enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
