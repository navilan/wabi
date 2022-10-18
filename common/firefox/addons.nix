{ buildFirefoxXpiAddon, fetchurl, lib, stdenv, ... }: {
  "downthemall" = buildFirefoxXpiAddon {
    pname = "downthemall";
    version = "4.4.1";
    addonId = "{DDC359D1-844A-42a7-9AA1-88A850A938A8}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3965183/downthemall-4.4.1.xpi";
    sha256 = "1911b6710d2b1b672d30135341e543041a60104aa200c343bc08393a8380b546";
    meta = with lib; {
      homepage = "https://www.downthemall.org/";
      description = "The Mass Downloader for your browser";
      license = licenses.gpl2;
      platforms = platforms.all;
    };
  };
  "svelte-devtools" = buildFirefoxXpiAddon {
    pname = "svelte-devtools";
    version = "1.3.0";
    addonId = "{a0370179-acc3-452f-9530-246b6adb2768}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3702386/svelte_devtools-1.3.0.xpi";
    sha256 = "sha256-57XaTeG1+D+tP2GZCVOQ9CdGCXt1hc8z9/5/7MK4om8=";
    meta = with lib; {
      homepage = "https://github.com/sveltejs/svelte-devtools";
      description = "Dev tools for the svelte framework";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
}
