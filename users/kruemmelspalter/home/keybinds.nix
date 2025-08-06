{ config, pkgs, inputs, lib,... }:

{

  wayland.windowManager.hyprland.settings = {

  #input config
    input = {
      kb_layout = "us,us";
      kb_variant = "intl,";
      kb_options = "grp:caps_toggle";
      numlock_by_default = true;
      touchpad = {
        natural_scroll = "yes";
      };
    };

 # keybinds
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$screenshot" = "slurp | grim -g - -  | wl-copy";

    bind = [
      # applications
      "$mod SHIFT, F, exec, librewolf"
      "$mod, RETURN, exec, $terminal"
      "$mod, M, exit,"
      "$mod, C, killactive"

      # caelestia
      "$mod, D, global, caelestia:showall"
      "Ctrl+Alt, Delete, global, caelestia:session"
      "$mod, L, global, caelestia:lock"
      "SUPER+Shift, S, global, caelestia:screenshotFreeze"
      "$mod ,SPACE , global, caelestia:launcher"
      
      # general hyprland
      "$mod, left, movefocus, l"
      "$mod, down, movefocus, d"
      "$mod, up, movefocus, u"
      "$mod, right, movefocus, r"
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, down, movewindow, d"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, right, movewindow, r"
      "$mod, v, togglefloating"
      "$mod, f, fullscreen"
      "$mod, s , exec, $screenshot"
      "$mod, j, togglesplit"

    ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];

    # audio and brightness
    bindle = [
      ",XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"
      ",XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
      ",XF86MonBrightnessDown, global, caelestia:brightnessDown"
      ",XF86MonBrightnessUp, global, caelestia:brightnessUp"
    ];

  };   
}
