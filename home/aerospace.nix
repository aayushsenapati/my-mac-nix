{ config, pkgs, lib, ... }:

{
  # AeroSpace tiling window manager configuration
  home.file.".aerospace.toml".text = ''
    # Reference: https://github.com/i3/i3/blob/next/etc/config

    # i3 doesn't have "normalizations" feature that why we disable them here.
    # But the feature is very helpful.
    # Normalizations eliminate all sorts of weird tree configurations that don't make sense.
    # Give normalizations a chance and enable them back.
    enable-normalization-flatten-containers = false
    enable-normalization-opposite-orientation-for-nested-containers = false

    # Mouse follows focus when focused monitor changes
    on-focused-monitor-changed = ['move-mouse monitor-lazy-center']

    start-at-login = true

    [mode.main.binding]
    # See: https://nikitabobko.github.io/AeroSpace/goodies#open-a-new-window-with-applescript
    #alt-cmd-enter = '''exec-and-forget osascript -e 'tell application "Kitty" to activate'
    #'''

    alt-cmd-enter= 'exec-and-forget open -n -a Kitty --args --single-instance -d ~ '
    #alt-cmd-e= 'exec-and-forget open -n -a Marta '


    # i3 wraps focus by default
    alt-cmd-h = 'focus --boundaries-action wrap-around-the-workspace left'
    alt-cmd-j = 'focus --boundaries-action wrap-around-the-workspace down'
    alt-cmd-k = 'focus --boundaries-action wrap-around-the-workspace up'
    alt-cmd-l = 'focus --boundaries-action wrap-around-the-workspace right'

    alt-cmd-shift-h = 'move left'
    alt-cmd-shift-j = 'move down'
    alt-cmd-shift-k = 'move up'
    alt-cmd-shift-l = 'move right'

    # Consider using 'join-with' command as a 'split' replacement if you want to enable normalizations
    alt-cmd-v = 'split horizontal'
    alt-cmd-shift-v = 'split vertical'

    alt-cmd-f = 'fullscreen'

    alt-cmd-s = 'layout v_accordion' # 'layout stacking' in i3
    alt-cmd-w = 'layout h_accordion' # 'layout tabbed' in i3
    alt-cmd-t = 'layout tiles horizontal vertical' # 'layout toggle split' in i3

    alt-cmd-space = 'layout floating tiling' # 'floating toggle' in i3
    alt-cmd-q= 'close --quit-if-last-window'
    # Not supported, because this command is redundant in AeroSpace mental model.
    # See: https://nikitabobko.github.io/AeroSpace/guide#floating-windows

    # alt-cmd-space = 'layout horizontal vertical'

    # `focus parent`/`focus child` are not yet supported, and it's not clear whether they
    # should be supported at all https://github.com/nikitabobko/AeroSpace/issues/5
    # alt-cmd-a = 'focus parent'

    alt-cmd-1 = 'workspace 1'
    alt-cmd-2 = 'workspace 2'
    alt-cmd-3 = 'workspace 3'
    alt-cmd-4 = 'workspace 4'
    alt-cmd-5 = 'workspace 5'
    alt-cmd-6 = 'workspace 6'
    alt-cmd-7 = 'workspace 7'
    alt-cmd-8 = 'workspace 8'
    alt-cmd-9 = 'workspace 9'
    alt-cmd-a = 'workspace A'
    alt-cmd-b = 'workspace B'
    alt-cmd-c = 'workspace C'
    alt-cmd-d = 'workspace D'
    alt-cmd-e = 'workspace E'

    alt-cmd-shift-1 = ['move-node-to-workspace 1']
    alt-cmd-shift-2 = ['move-node-to-workspace 2']
    alt-cmd-shift-3 = ['move-node-to-workspace 3']
    alt-cmd-shift-4 = ['move-node-to-workspace 4']
    alt-cmd-shift-5 = ['move-node-to-workspace 5']
    alt-cmd-shift-6 = ['move-node-to-workspace 6']
    alt-cmd-shift-7 = ['move-node-to-workspace 7']
    alt-cmd-shift-8 = ['move-node-to-workspace 8']
    alt-cmd-shift-9 = ['move-node-to-workspace 9']
    alt-cmd-shift-a = ['move-node-to-workspace A']
    alt-cmd-shift-b = ['move-node-to-workspace B']
    alt-cmd-shift-c = ['move-node-to-workspace C']
    alt-cmd-shift-d = ['move-node-to-workspace D']
    alt-cmd-shift-e = ['move-node-to-workspace E']

    alt-cmd-shift-tab = 'move-workspace-to-monitor --wrap-around next'
    alt-cmd-tab = 'workspace-back-and-forth'
    alt-cmd-shift-r = 'reload-config'

    alt-cmd-r = 'mode resize'

    [mode.resize.binding]
    k = 'resize width -50'
    shift-j = 'resize height +50'
    shift-k = 'resize height -50'
    j = 'resize width +50'

    enter = 'mode main'
    esc = 'mode main'

    [gaps]
    inner.horizontal = 5
    inner.vertical =   5
    outer.left =       5
    outer.bottom =     5
    outer.top =        5
    outer.right =      5
  '';
} 