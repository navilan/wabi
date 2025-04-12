# https://raw.githubusercontent.com/johanssone/dots/96af96033a5339d92dedf70ccff25e5113cec69a/users/profiles/firefox/default.nix
moduleArgs@{ config, lib, pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  inherit (pkgs.nur.repos.rycee) firefox-addons;
  readFile = builtins.readFile;
  hostName = builtins.getEnv "HOSTNAME";
  extra = let
    pkgsWithXpiBuilder = pkgs // {
      inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
    };
  in pkgs.lib.callPackageWith pkgsWithXpiBuilder ./addons.nix { };

  disableTelemetry = {
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "browser.ping-centre.telemetry" = false;
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.hybridContent.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.reportingpolicy.firstRun" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
  };

  privacySettings = {
    "network.dns.disablePrefetch" = true;
    "privacy.donottrackheader.enabled" = true;
    "privacy.donottrackheader.value" = 1;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.socialtracking.annotate.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
  };

  defaultSettings = privacySettings // disableTelemetry // {
    "app.update.auto" = false;
    "browser.bookmarks.showMobileBookmarks" = false;
    "browser.ctrlTab.recentlyUsedOrder" = false;
    "browser.proton.enabled" = true;
    "browser.newtabpage.enabled" = false;

    # Enable a real search bar on `about:home` instead of diverting focus to the address bar.
    "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" =
      false;

    "browser.search.hiddenOneOffs" = "Google,Yahoo,Bing,Amazon.com,Twitter";
    "browser.search.region" = "US";
    "browser.search.suggest.enabled" = false;
    "browser.send_pings" = false;
    "browser.startup.homepage" = "https://web.tabliss.io";

    # 0 = Normal; 1 = Compact; 2 = Touch
    "browser.uidensity" = 1;

    "browser.urlbar.placeholderName" = "…";
    "browser.urlbar.showSearchSuggestionsFirst" = false;
    "browser.urlbar.suggest.calculator" = true;
    "browser.urlbar.suggest.history" = true;

    "extensions.pocket.enabled" = false;

    # Allow extensions to run on Mozilla domains.
    # Required for Tridactyl and Dark Reader support on those pages.
    # See https://github.com/tridactyl/tridactyl/issues/1800
    "extensions.webextensions.restrictedDomains" = "";

    "font.default.x-western" = "Anivers, Ubuntu, Helvetica, Arial, sans-serif";
    "font.name.monospace.x-western" = "PragmataPro, Menlo, Consolas, monospace";
    "font.name.sans-serif.x-western" =
      "Anivers, Ubuntu, Helvetica, Arial, sans-serif";
    "font.name.serif.x-western" = "Monteserrat, Times New Roman, sans-serif";
    "font.size.monospace.x-western" = 24;

    "identity.fxaccounts.account.device.name" = hostName;

    # CSS blur filter in v88+
    "layout.css.backdrop-filter.enabled" = true;

    # Disable fingerprinting on AMO for Tridactyl.
    # See https://github.com/tridactyl/tridactyl/issues/1800
    "privacy.resistFingerprinting.block_mozAddonManager" = true;

    "security.enterprise_roots.enabled" = true;
    "services.sync.declinedEngines" =
      "addons,prefs,creditcards,addresses,tabs,passwords";
    "services.sync.engine.addons" = false;
    "services.sync.engine.passwords" = false;
    "services.sync.engine.prefs" = false;
    "services.sync.engineStatusChanged.addons" = true;
    "services.sync.engineStatusChanged.prefs" = true;
    "signon.rememberSignons" = false;

    # Notifications
    "permissions.default.desktop-notification" = 2;

    # https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-context-properties
    "svg.context-properties.content.enabled" = true;

    # Enable custom stylesheets.
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "layers.acceleration.force-enabled" = true;
    "gfx.webrender.all" = true;

    # Behavior
    "browser.tabs.closeWindowWithLastTab" = false;
  };

  styles = {
    wabi = {
      userChrome = ''
        ${readFile ./userChrome.css}
      '';
      userContent = ''
        ${readFile ./userContent.css}
      '';
    };
  };
in {
  xdg.configFile."tridactyl".source = ./tridactyl;

  programs.firefox = {
    enable = true;
    package = if isDarwin then
      pkgs.firefox-darwin
    else
      pkgs.firefox-wayland.override {
        extraPolicies = {
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DisableFirefoxAccounts = true;
          FirefoxHome = {
            Pocket = false;
            Snippets = false;
          };
          OfferToSaveLogins = false;
          UserMessaging = {
            SkipOnboarding = true;
            ExtensionRecommendations = false;
          };
        };
        cfg = {
          # Gnome shell native connector
          enableGnomeExtensions =
            moduleArgs.osConfig.services.gnome.chrome-gnome-shell.enable;
          # Tridactyl native connector
          enableTridactylNative = true;
        };
      };

    profiles.wabi = {
      id = 0;

      extensions.packages = with firefox-addons; [
        browserpass
        copy-selection-as-markdown
        darkreader
        df-youtube
        display-_anchors
        multi-account-containers
        org-capture
        single-file
        stylus
        temporary-containers
        # tridactyl
        ublock-origin
        unpaywall
        extra.downthemall
        extra.svelte-devtools
        i-dont-care-about-cookies
        leechblock-ng
      ];
      settings = defaultSettings;

      userChrome = ''
          ${styles.wabi.userChrome}
        # '';

      userContent = ''
          ${styles.wabi.userContent}
        # '';
    };
  };
}
##: References
#
# - https://github.com/cmacrae/config/blob/5a32507753339a2ee45155b78b76fda0824002a0/modules/macintosh.nix#L331-L407
# - https://restoreprivacy.com/firefox-privacy/
