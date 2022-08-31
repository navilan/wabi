{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    mvt-src = {
      url = "github:mvt-project/mvt";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, mvt-src }:
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
        mvt = with pythonPkgs; buildPythonPackage rec {
          pname = "mvt";
          version = "2.1.5";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-kfiv5G6JXOX9Yyvcdc0zWORvKnHcmJBpfw+lnq3a7pk=";
          };
          buildInputs = [ flake8 ];
          doCheck = false;
          propagatedBuildInputs = [
            adb-shell
            simplejson
            rich iOSbackup
            requests
            click
            libusb1
            pyyaml
            appdirs
            packaging
            tld
          ];
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            mvt
          ];
        };
      }
    );
}
