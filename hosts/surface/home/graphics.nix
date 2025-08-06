{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings.monitor = [
    " eDP-1, 1920x1280@60, auto, 1"
  ];
}
