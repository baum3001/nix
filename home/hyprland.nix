{ inputs, config, pkgs, lib,  ...}:

{

  # Hyprland config 
  wayland.windowManager.hyprland.settings = {
    

  #input config
    input = {
      kb_layout = lib.mkForce "de";
      
      touchpad ={
        natural_scroll = lib.mkForce "yes";
      };

    };

  # gesture config
    gestures = {
      workspace_swipe = lib.mkForce true;

    };

  # keybindss

    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun";
    "$screenshot" = "slurp | grim -g - -  | wl-copy";

    bind = [
      "$mod, F, exec, librewolf"
      "$mod, M, exit,"
      "$mod, C, killactive,"


    ];

    bindm = [
      

    ];

    # bindel = [
    #   ",XF86AudioRaiseVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume=+5"
    #   ",XF86AudioLowerVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume=-5"
    #   ",XF86MonBrightnessDown, exec, ${pkgs.swayosd}/bin/swayosd-client --brightness lower"
    #   ",XF86MonBrightnessUp, exec, ${pkgs.swayosd}/bin/swayosd-client --brightness raise"
    # ];

  # exec
    exec-once = [
      # "systemctl --user start waybar"
      # "systemctl --user start hyprpolkitagent"
      # "systemctl --user start hyprpaper"
      # "systemctl --user start swayosd"
    ];

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      
      disable_hyprland_logo = lib.mkDefault true; # If true disables the random hyprland logo / anime girl background. :(
    };
  };
}