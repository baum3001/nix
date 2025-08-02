{ inputs, config, pkgs, specialArgs, ...}:
{
wayland.windowManager.hyprland.settings.monitor = [
    " eDP-1, 2048x1280@120.00, 0x0, 1"
    ];

}