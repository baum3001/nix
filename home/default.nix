{ inputs, config, pkgs, specialArgs, ...}:


let hostPath = specialArgs.hostPath;
in
{
  imports = [
    ./hyprland.nix
    ./programs
    inputs.catppuccin.homeModules.catppuccin
    "${toString hostPath}/home"
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
  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

}
