{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:

{
  imports = [
    ./programs
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.username = "baum";
  home.homeDirectory = "/home/baum";
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
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaSapphire;
      name = "catppuccin-mocha-sapphire-cursors";
      size = 10;
    };

  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

}
