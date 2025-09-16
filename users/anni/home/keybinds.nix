{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{

  wayland.windowManager.hyprland.settings = {

    #input config
    input = {
      kb_layout = "de";
      numlock_by_default = true;
      touchpad = {
        natural_scroll = "yes";
      };

    };

    # keybinds

    "$mod" = "SUPER";
    "$terminal" = "footclient";
    "$screenshot" = "slurp | grim -g - -  | wl-copy";

    bind = [

      # applications
      "$mod, F, exec, librewolf"
      "$mod, Q, exec, $terminal"
      "$mod, M, exit,"
      "$mod, C, killactive"

      # caelestia

      "$mod, D, global, caelestia:showall"
      "Ctrl+Alt, Delete, global, caelestia:session"
      "$mod, L, global, caelestia:lock"
      "SUPER+Shift, S, global, caelestia:screenshotFreeze"
      "$mod ,SPACE , global, caelestia:launcher"
      "$mod, W, exec, caelestia emoji -p"
      "$mod, V, exec, caelestia clipboard"
      "$mod+Shift, V, exec, caelestia clipboard -d"

      # general hyprland

      "$mod, left, movefocus, l"
      "$mod, down, movefocus, d"
      "$mod, up, movefocus, u"
      "$mod, right, movefocus, r"
      "$mod CTRL, left, movewindow, l"
      "$mod CTRL, down, movewindow, d"
      "$mod CTRL, up, movewindow, u"
      "$mod CTRL, right, movewindow, r"
      "$mod, t, togglefloating"
      "$mod, s , exec, $screenshot"
      "$mod, j, togglesplit"
      "$mod, a, fullscreen"
      "$mod, s, exec, hyprctl rule active stayfocused"

    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      )
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
