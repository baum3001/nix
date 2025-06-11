{ inputs, config, pkgs, ...}:
{  
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload =
        [ "~/etc/nixos/sharkpaper.png" ];
      wallpaper = [
        "eDP-1,~/etc/nixos/sharkpaper.png"
      ];
    };
  };


}