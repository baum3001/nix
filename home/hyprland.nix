{ inputs, config, pkgs, ...}:

{
  # Hyprland config 
  wayland.windowManager.hyprland.settings = {
    
    monitor = [
      "eDP-1, 1920x1280@60, auto, 1"
    ];

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
    "$menu" = "wofi --show drun";

    bind = [
      "$mod, F, exec, librewolf"
      "$mod, Q, exec, $terminal"
      "$mod, M, exit,"
      "$mod, R, exec, $menu"
      "$mod, C, killactive,"

      "$mod, left, movefocus, l"
      "$mod, down, movefocus, d"
      "$mod, up, movefocus, u"
      "$mod, right, movefocus, r"
      "$mod CTRL, left, movewindow, l"
      "$mod CTRL, down, movewindow, d"
      "$mod CTRL, up, movewindow, u"
      "$mod CTRL, right, movewindow, r"

      ", Print, exec, grimblast copy area" 
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

  # exec
    exec-once = [
      "waybar"
      "systemctl --user start hyprpolkitagent"
    ];

  };
}