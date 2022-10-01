{ self, deploy, ... }:

{
  nodes = {
    sabi = {
      hostname = "192.168.64.8:22";
      fastConnection = true;
      profiles = {
        system = {
          sshUser = "navilan";
          user = "root";
          path = deploy.lib.aarch64-linux.activate.nixos
            self.nixosConfigurations.sabi;
        };
      };
    };
  };
}
