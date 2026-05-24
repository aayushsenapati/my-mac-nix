{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Aayush Senapati";
    userEmail = "aayushsenapati2002@gmail.com";
    
    # Basic configuration
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
} 