{ inputs, config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./hyprland.nix
    ./hyprpaper.nix
    inputs.catppuccin.homeModules.catppuccin
  ];


  home.username = "baum";
  home.homeDirectory = "/home/baum";
  home.stateVersion = "25.05";

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "peach";
    cursors.enable = false;
  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

}
