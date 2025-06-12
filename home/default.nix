{ inputs, config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./hyprland.nix
    ./hyprpaper.nix
  ];


  home.username = "baum";
  home.homeDirectory = "/home/baum";
  home.stateVersion = "25.05";


  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

}
