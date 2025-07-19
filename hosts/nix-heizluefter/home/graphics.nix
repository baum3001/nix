{ inputs, config, pkgs, specialArgs, ...}:
{
wayland.windowManager.hyprland.settings.monitor = [
      " DP-2, 4096x2160, 0x0, 1"
      " HDMI-A-1, 1920x1280@60, 1236x-1080, 1"
      " HDMI-A-2, 1920x1280, auto-right, 1, transform, 1"
      " DP-1, 1920x1280@60, auto-left, 1, transform, 1"
    ];

}