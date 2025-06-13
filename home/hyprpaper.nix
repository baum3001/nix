{ inputs, config, pkgs,  ...}:
{  
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload =
        [ "~/etc/nixos/darksharkleft.jpg" ];
      wallpaper = [
        "eDP-1,~/etc/nixos/darksharkleft.jpg"
        "DP-2,~/etc/nixos/darksharkleft.jpg"
      ];
    };
  };


}