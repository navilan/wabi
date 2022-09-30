{ config, pkgs, modulesPath, user, ... }: {
  imports = [ ../../vms/shared.nix ];

  # Interface is this on my M1
  networking.interfaces.enp0s8.useDHCP = true;

  # Qemu
  services.spice-vdagentd.enable = true;

  # For now, we need this since hardware acceleration does not work.
  environment.variables.LIBGL_ALWAYS_SOFTWARE = "1";

  # Lots of stuff that uses aarch64 that claims doesn't work, but actually works.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  nix.settings.allowed-users = [ "${user}" ];
  nix.package = pkgs.nixUnstable;

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

  networking = { hostName = "sabi"; };

}
