{ config, pkgs, ... }:

{
  # Configure Kitty via home.file
  home.file.".config/kitty/kitty.conf".text = ''
    # Font configuration
    font_family JetBrains Mono
    font_size 14.0

    # Theme
    include ./tokyo_night.conf

    # Window settings
    window_padding_width 8
    window_padding_height 8
    
    # Cursor settings
    cursor_shape block
    cursor_blink_interval 0
    
    # Scrollback
    scrollback_lines 10000
    
    # Performance
    repaint_delay 10
    input_delay 3
    sync_to_monitor yes
    
    # Bell
    enable_audio_bell no
    visual_bell_duration 0.0
    
    # Tab bar
    tab_bar_edge top
    tab_bar_style powerline
    tab_powerline_style slanted
    
    # Misc
    allow_remote_control yes
    shell_integration enabled
    
    # macOS specific
    macos_titlebar_color background
    macos_option_as_alt yes
    macos_quit_when_last_window_closed yes
    
    # Key bindings
    map cmd+t new_tab
    map cmd+w close_tab
    map cmd+shift+] next_tab
    map cmd+shift+[ previous_tab
    
    map cmd+n new_window
    map cmd+shift+n new_os_window
    
    map cmd+plus increase_font_size
    map cmd+minus decrease_font_size
    map cmd+0 restore_font_size
    
    map cmd+c copy_to_clipboard
    map cmd+v paste_from_clipboard
    
    map cmd+up scroll_line_up
    map cmd+down scroll_line_down
    map cmd+page_up scroll_page_up
    map cmd+page_down scroll_page_down
    map cmd+home scroll_home
    map cmd+end scroll_end
  '';

  # Install Tokyo Night theme
  home.file.".config/kitty/tokyo_night.conf".text = ''
    # Tokyo Night theme for Kitty
    foreground #a9b1d6
    background #1a1b26
    
    # Black
    color0 #32344a
    color8 #444b6a
    
    # Red
    color1 #f7768e
    color9 #ff9e64
    
    # Green
    color2 #9ece6a
    color10 #9ece6a
    
    # Yellow
    color3 #e0af68
    color11 #e0af68
    
    # Blue
    color4 #7aa2f7
    color12 #7aa2f7
    
    # Magenta
    color5 #bb9af7
    color13 #bb9af7
    
    # Cyan
    color6 #7dcfff
    color14 #7dcfff
    
    # White
    color7 #a9b1d6
    color15 #c0caf5
    
    # Cursor
    cursor #c0caf5
    cursor_text_color #1a1b26
    
    # Selection highlight
    selection_foreground none
    selection_background #33467C
    
    # The color for highlighting URLs on mouse-over
    url_color #73daca
    
    # Window borders
    active_border_color #3d59a1
    inactive_border_color #101014
    bell_border_color #e0af68
    
    # Tab bar
    tab_bar_background #15161E
    active_tab_foreground #3d59a1
    active_tab_background #1a1b26
    inactive_tab_foreground #787c99
    inactive_tab_background #15161E
  '';
} 