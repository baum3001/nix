{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings.monitor = [
    
    "VGA-1,1400x1050@59,auto,0.5" # beamer

  ];

}
