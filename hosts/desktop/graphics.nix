{ inputs, config, pkgs, specialArgs, ...}:
{
wayland.windowManager.hyprland.settings.monitor = [
      " eDP-1, 1920x1280@60, auto, 1"
    ];
services.hyprpaper.settings.wallpaper = [
        "DP-2,~/etc/nixos/darksharkleft.jpg"
      ];
}