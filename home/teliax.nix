{
  inputs,
  config,
  pkgs,
  specialArgs,
  lib,
  ...
}:

{
  imports = [
    ./programs
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.username = "teliax";
  home.homeDirectory = "/home/teliax";
  home.stateVersion = "25.05";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    cursors.enable = false;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "mocha";
        size = "compact";
      };
    };
  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

}
