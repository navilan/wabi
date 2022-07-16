{ config, pkgs, ... }:

{
  services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql_13;
      dataDir = "/Users/navilan/.local/share/postgresql/data";
    };
  };

  # Create the PostgreSQL data directory, if it does not exist.
  system.activationScripts.preActivation = {
    enable = true;
    text = ''
      if [ ! -d "/Users/navilan/.local/share/postgresql/data" ]; then
        echo "creating PostgreSQL data directory..."
        sudo mkdir -m 775 -p /Users/navilan/.local/share/postgresql/data
        chown -R navilan:staff  /Users/navilan/.local/share/postgresql/data
      fi
    '';
  };

  # Direct log output to $XDG_DATA_HOME/postgresql for debugging.
  launchd.user.agents.postgresql.serviceConfig = {
    StandardErrorPath = "/Users/navilan/.local/share/postgresql/postgres.error.log";
    StandardOutPath = "/Users/navilan/.local/share/postgresql/postgres.out.log";
  };

  home-manager.users = {
    navilan = {
      # Create the directory /Users/navilan/.local/share/postgresql/
      home.file.".local/postgresql/.keep".text = "";
    };
  };
}
