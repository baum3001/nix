{ inputs, config, pkgs, specialArgs, ...}:
{
wayland.windowManager.hyprland.settings.monitor = [
      " DP-1, 4096x2160, 0x0, 1"
      " HDMI-A-1, 1920x1280@60, 2048x-1080, 1"
      " HDMI-A-2, 1920x1280, auto-right, 1, transform, 1"
      " DP-2, 1920x1280@60, auto-left, 1, transform, 1"
    ];
services.hyprpaper.settings = {
  wallpaper = [
    "DP-1,~/etc/nixos/sharkpaper.png"
    "DP-2,~/etc/nixos/darksharkleft.jpg"
    "HDMI-A-1,~/etc/nixos/darksharkleft.jpg"
    "HDMI-A-2,~/etc/nixos/darksharkleft.jpg"
  ];
  preload =
    [ 
      "~/etc/nixos/darksharkleft.jpg"
      "~/etc/nixos/sharkpaper.png"
    ];
    
};

}