{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    
    # Basic settings
    terminal = "screen-256color";
    historyLimit = 10000;
    shell = "${pkgs.zsh}/bin/zsh";
    
    # Enable vi mode
    keyMode = "vi";
    
    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      yank          # Better clipboard integration
      sensible      # Sensible defaults
    ];
    
    # Custom key bindings
    extraConfig = ''
      # Vi-style copy mode
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
      bind-key -T copy-mode-vi 'r' send -X rectangle-toggle
      
      # Easy scrolling
      bind-key -T copy-mode-vi 'k' send -X cursor-up
      bind-key -T copy-mode-vi 'j' send -X cursor-down
      bind-key -T copy-mode-vi 'h' send -X cursor-left
      bind-key -T copy-mode-vi 'l' send -X cursor-right
      
      # Page navigation
      bind-key -T copy-mode-vi 'u' send -X halfpage-up
      bind-key -T copy-mode-vi 'd' send -X halfpage-down
      bind-key -T copy-mode-vi 'g' send -X history-top
      bind-key -T copy-mode-vi 'G' send -X history-bottom
      
      # Search
      bind-key -T copy-mode-vi '/' send -X search-forward
      bind-key -T copy-mode-vi '?' send -X search-backward
      
      # Mouse support
      set -g mouse on
      
      # Ensure proper shell initialization
      set -g default-command "${pkgs.zsh}/bin/zsh"
      set -g default-shell "${pkgs.zsh}/bin/zsh"
      
      # Easier prefix key
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix
      
      # vim-tmux-navigator
      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
      
      # Pane resizing with Alt+hjkl
      bind-key -n 'M-h' resize-pane -L 5
      bind-key -n 'M-j' resize-pane -D 5
      bind-key -n 'M-k' resize-pane -U 5
      bind-key -n 'M-l' resize-pane -R 5
      
      # Fine-grained resizing with Alt+Shift+hjkl
      bind-key -n 'M-H' resize-pane -L 1
      bind-key -n 'M-J' resize-pane -D 1
      bind-key -n 'M-K' resize-pane -U 1
      bind-key -n 'M-L' resize-pane -R 1
      
      # Quick resize presets
      bind-key '=' select-layout even-horizontal
      bind-key '|' select-layout even-vertical
    '';
  };
} 