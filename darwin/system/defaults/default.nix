{ config, pkgs, ... }: {
  system.defaults = {
    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = true;
      _FXShowPosixPathInTitle = true;
    };
    trackpad = {
      ActuationStrength = 1;
      Clicking = false;
      FirstClickThreshold = 1;
      SecondClickThreshold = 1;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    dock = {
      autohide = true;
      autohide-delay = "0.0";
      autohide-time-modifier = "1.0";
      tilesize = 96;
      static-only = false;
      showhidden = false;
      show-recents = false;
      show-process-indicators = true;
      orientation = "left";
      mru-spaces = false;
    };
    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.sound.beep.volume" = "0.000";
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 10;
      KeyRepeat = 2;
      AppleShowAllExtensions = false;
      AppleShowScrollBars = "Automatic";
      _HIHideMenuBar = true;
    };
  };
}
