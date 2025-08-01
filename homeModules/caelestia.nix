{ config, pkgs, inputs, lib,... }:

{
  home.packages = with pkgs ;[
    inputs.caelestia.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default
  ];

  # Hyprland config 
  wayland.windowManager.hyprland.settings = {
    

  #input config
    input = {
      kb_layout = "de";
      
      touchpad ={
        natural_scroll = "yes";
      };

    };

  # gesture config
    gestures = {
      workspace_swipe = true;

    };

  # keybinds

    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$screenshot" = "slurp | grim -g - -  | wl-copy";


    bind = [

    # applications
      "$mod, F, exec, librewolf"
      "$mod, Q, exec, $terminal"
      "$mod, M, exit,"
      "$mod, C, killactive,"

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
      "$mod CTRL, left, movewindow, l"
      "$mod CTRL, down, movewindow, d"
      "$mod CTRL, up, movewindow, u"
      "$mod CTRL, right, movewindow, r"
      "$mod, v, togglefloating"
      "$mod, s , exec, $screenshot"

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

  # exec
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "systemctl --user start swayosd"
      "caelestia shell -d"
    ];
    general = {
      gaps_in = "3";
      gaps_out = "10";
      border_size = "2";
      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = "false";
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = "false";
      layout = "dwindle";
    };
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 10;
      rounding_power = 2;
      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        # color = "rgba(1a1a1aee)";
      };
      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = true;
      # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];
      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };
    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };
      dwindle = let ALWAYS_EAST = 2; 
      in {
        force_split = ALWAYS_EAST;
        preserve_split = true;
      };
  };
}