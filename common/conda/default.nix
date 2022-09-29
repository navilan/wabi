{ inputs, system, config, lib, pkgs, ... }:
    let
      conda-sh = inputs."conda-${system}";
      conda-home = "~/.conda";
      libPath = pkgs.lib.makeLibraryPath [
        pkgs.zlib
      ];
      conda = pkgs.runCommand "conda-install"
        { nativeBuildInputs = [ pkgs.makeWrapper ]; buildInputs = [ pkgs.zlib ]; }
        ''
          mkdir -p $out/bin
          sed 's/unset LD_LIBRARY_PATH/#nset LD_LIBRARY_PATH/' ${conda-sh} > $out/bin/miniconda-installer.sh
          chmod +x $out/bin/miniconda-installer.sh

          makeWrapper                            \
            $out/bin/miniconda-installer.sh      \
            $out/bin/conda-install               \
            --add-flags "-p ${conda-home}"       \
            --add-flags "-b"                     \
            --prefix "LD_LIBRARY_PATH" : "${libPath}"
        '';
      in
        [
          conda
        ]
