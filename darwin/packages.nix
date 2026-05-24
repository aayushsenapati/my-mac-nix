{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = [
    pkgs.neovim
    pkgs.raycast
    pkgs.code-cursor
    pkgs.aerospace
    pkgs.oxker
    #pkgs.lmstudio
    pkgs.ffmpeg-full
    #pkgs.zed-editor
    pkgs.vscode
    pkgs.ngrok
    #pkgs.whatsapp-for-mac
    pkgs.pam-reattach  # For Touch ID support in tmux
  ];

  # Homebrew configuration
  homebrew = {
    enable = true;

    brews = [
      #"docker"
      #"ollama"
      #"gemini-cli"
      #"llama.cpp"


    ];

    casks = [
      #"visual-studio-code"
      "arc"
      "claude-code"
      #"lm-studio"
      #"void"
      #"firefox"
      "docker-desktop"
      "slack"
      "visual-studio-code@insiders"
      "whatsapp"
      #"droid"
      "obsidian"
      #"zed"
      #"mediosz/tap/swipeaerospace"
      #"nikitabobko/tap/aerospace"
    ];

    taps = [
      "nikitabobko/tap"
    ];
    
    # Auto-update options
    onActivation = {
      autoUpdate = true;    # Run `brew update` during system activation
      upgrade = true;       # Run `brew upgrade` during system activation
      cleanup = "zap";
    };
  };

  # Fonts
  fonts.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.nerd-fonts.jetbrains-mono
  ];
} 