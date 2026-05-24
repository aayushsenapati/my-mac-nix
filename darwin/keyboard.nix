{ config, pkgs, ... }:

{
  # Keyboard shortcuts and symbolic hotkeys
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # Cmd+Shift+3: Save screen to clipboard
        "29" = {
          enabled = true;
          value = {
            parameters = [ 51 20 1179648 ];
            type = "standard";
          };
        };
        # Cmd+Shift+Ctrl+3: Copy screen to file
        "28" = {
          enabled = true;
          value = {
            parameters = [ 51 20 1441792 ];
            type = "standard";
          };
        };
        # Cmd+Shift+4: Save selection to clipboard
        "31" = {
          enabled = true;
          value = {
            parameters = [ 52 21 1179648 ];
            type = "standard";
          };
        };
        # Cmd+Shift+Ctrl+4: Copy selection to file
        "30" = {
          enabled = true;
          value = {
            parameters = [ 52 21 1441792 ];
            type = "standard";
          };
        };
        # Cmd+Shift+5: Screenshot options
        "184" = {
          enabled = true;
          value = {
            parameters = [ 53 23 1179648 ];
            type = "standard";
          };
        };
      };
    };
  };
} 