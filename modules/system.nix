{ config, pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #
  ###################################################################################
{
  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      dock.autohide = false;
      dock.mru-spaces = false;
      dock.minimize-to-application = true;
      dock.show-recents = false;

      spaces.spans-displays = false;
      screencapture.location = "~/Pictures/screen-grabs";

      finder.AppleShowAllExtensions = true;
      finder.FXEnableExtensionChangeWarning = false;
      finder.CreateDesktop = false;
      finder.FXPreferredViewStyle = "Nlsv"; # list view
      finder.ShowPathbar = true;

      loginwindow.GuestEnabled = false;

      CustomUserPreferences = {
        # Finder's default location upon open
        "com.apple.finder".NewWindowTargetPath = "file://Users/cyberglot/";
      };

      NSGlobalDomain.AppleICUForce24HourTime = true;
      NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
      NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
      NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  time.timeZone = "Europe/London";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      font-awesome
      emacs-all-the-icons-fonts

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/data/fonts/nerdfonts/shas.nix
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "Hack"
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}
