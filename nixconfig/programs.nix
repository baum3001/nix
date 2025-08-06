{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr = {
      enable = true;
    };
    hyprland = {
      enable = true;
    };
    adb = {
      enable = true;
    };
  };
  fonts.packages = with pkgs; [
    ipafont
  ];

}
