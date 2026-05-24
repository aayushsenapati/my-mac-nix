{ config, pkgs, lib, ... }:

{
  # Install the CLI tools we need
  home.packages = with pkgs; [
    eza        # Modern ls replacement
    bat        # Modern cat replacement  
    zoxide     # Smart cd replacement
    fzf        # Fuzzy finder
    starship   # Cross-shell prompt
    kubectl    # Kubernetes CLI
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    defaultKeymap = "viins";
    
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };
   
    
    # Aliases
    shellAliases = {
      # File operations
      ls = "eza --icons --color";
      ll = "eza --icons --color -la";
      la = "eza --icons --color -la";
      lt = "eza --icons --color --tree";
      cat = "bat";
      
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      cd = "z";  # Use zoxide
      
      # Utilities
      grep = "grep --color=auto";
      k = "kubectl";
      
      # Nix development
      nix-dev = "nix develop -c $SHELL";
      
      # Git shortcuts
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline";
    };
    
    # Custom functions and initialization
    initContent = ''
      # Vi mode: make Escape responsive
      export KEYTIMEOUT=1

      # Fix backspace in insert mode (allow deleting past insert point)
      bindkey -M viins '^?' backward-delete-char
      bindkey -M viins '^H' backward-delete-char

      # Initialize tools
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"

      # Custom function: open files with fzf preview
      openwith() {
        local file
        file=$(fzf -m --preview='bat --color=always {}') && $1 "$file"
      }
      
      zed() {
        open "$1" -a Zed;
      }
    
      # push using work key
      gpush-work() {
        GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519 -o IdentitiesOnly=yes' git push "$@"
      }

      # push using personal key
      gpush-personal() {
        GIT_SSH_COMMAND='ssh -i ~/.ssh/id_ed25519_github_personal -o IdentitiesOnly=yes' git push "$@"
      }
      
      # FZF configuration
      export FZF_CTRL_T_OPTS="
        --walker-skip .git,node_modules,target
        --preview 'bat -n --color=always {}'
        --bind 'ctrl-/:change-preview-window(down|hidden|)'"
      
      export FZF_CTRL_R_OPTS="
        --preview 'echo {}' --preview-window up:3:hidden:wrap
        --bind 'ctrl-/:toggle-preview'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
        --color header:italic
        --header 'Press CTRL-Y to copy command into clipboard'"
      
      # Path additions
      export PATH=$PATH:/opt/local/bin
    '';
  };
  
  # Configure starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = false;  # Manually init'd in initContent to control order
  };

  # Configure fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}