{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1, 2560x1600@60, auto, 1"
  ];
}
