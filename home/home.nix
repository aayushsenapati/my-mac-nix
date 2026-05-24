{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./kitty.nix
    ./aerospace.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aayush.senapati";
  home.homeDirectory = "/Users/aayush.senapati";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Basic packages that don't need complex configuration
  home.packages = with pkgs; [
    # Terminal emulator
    kitty
    # Add any other packages you want here
  ];

  # Symlink nvim config (AstroNvim) — writable, points to local checkout
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/Users/aayush.senapati/.config/nix/nvim";
} 