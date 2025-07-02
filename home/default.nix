{ inputs, config, pkgs, specialArgs, ...}:


let hostPath = specialArgs.hostPath;
in
{
  imports = [
    ./hyprland.nix
    ./programs
#    ./quickshell
   #  ./hyprpaper.nix
    inputs.catppuccin.homeModules.catppuccin
#    inputs.illogical-impulse.homeManagerModules.default
#    ./illogical-impulse.nix
    "${toString hostPath}/graphics.nix"
  ];
  

  home.username = "baum";
  home.homeDirectory = "/home/baum";
  home.stateVersion = "25.05";

  catppuccin = {
    enable = false;
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
