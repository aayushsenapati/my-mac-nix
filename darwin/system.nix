{ config, pkgs, ... }:

{
  # Enable Touch ID for sudo with pam_reattach for tmux support
  security.pam.services.sudo_local.touchIdAuth = true;
  
  # Create sudo_local file with pam_reattach for tmux Touch ID support
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';

  # System preferences
  system.defaults = {
    dock = {
      autohide = true;                # Auto-hide dock
      autohide-delay = 0.0;          # Remove delay before showing dock
      autohide-time-modifier = 0.4;   # Speed up dock animation
      orientation = "bottom";         # Dock position
      show-recents = false;          # Don't show recent apps
      mineffect = "scale";           # Minimize effect
      minimize-to-application = true; # Minimize windows into app icon
      tilesize = 48;                 # Dock icon size
    };
    
    finder = {
      AppleShowAllExtensions = true;  # Show file extensions
      ShowPathbar = true;            # Show path bar
      ShowStatusBar = true;          # Show status bar
      FXDefaultSearchScope = "SCcf"; # Search current folder by default
    };
    
    NSGlobalDomain = {
      # Mouse and trackpad
      "com.apple.mouse.tapBehavior" = 1;           # Tap to click
      "com.apple.swipescrolldirection" = true;    # Disable natural scrolling
      AppleShowScrollBars = "Always";              # Always show scroll bars
      
      # Keyboard
      #ApplePressAndHoldEnabled = false;            # Disable press and hold for accents
      #InitialKeyRepeat = 15;                       # Fast key repeat
      #KeyRepeat = 2;                               # Very fast key repeat
      
      # Interface
      AppleInterfaceStyle = "Dark";                # Dark mode
      
      # Misc
      AppleShowAllExtensions = true;               # Show all file extensions
      NSNavPanelExpandedStateForSaveMode = true;   # Expand save panel by default
      NSNavPanelExpandedStateForSaveMode2 = true;  # Expand save panel by default
    };
    
    trackpad = {
      Clicking = true;                    # Tap to click
      TrackpadThreeFingerDrag = true;    # Three finger drag
      TrackpadRightClick = true;         # Right click
    };
    
    # Mission Control
    spaces.spans-displays = false;       # Don't span displays
    
    # Screenshots
    screencapture = {
      location = "~/Desktop";            # Screenshot location
      type = "png";                      # Screenshot format
    };
  };

  # Activation script to apply preferences immediately
  system.activationScripts.postActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    sudo -u "aayush.senapati" /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
} 