{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/master";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonPkgs = pkgs.python38.pkgs;
        NSKeyedUnArchiver = with pythonPkgs; buildPythonPackage rec {
          pname = "NSKeyedUnArchiver";
          version = "1.5";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-7toEgAIYFzNuD/6sqAN3wajwjsxfwGvkg7SMRLrUFPQ=";
          };
          buildInputs = [ flake8 ];
          doCheck = false;
          propagatedBuildInputs = [];
        };
        iOSbackup = with pythonPkgs; buildPythonPackage rec {
          pname = "iOSbackup";
          version = "0.9.923";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-Lpd0i4Las6ecK0OhiP7qc7AAkW6szAA2XOOqjvkbrVg=";
          };
          buildInputs = [ flake8 ];
          doCheck = false;
          propagatedBuildInputs = [ NSKeyedUnArchiver biplist pycryptodome ];
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ ];
        };
      }
    );
}
