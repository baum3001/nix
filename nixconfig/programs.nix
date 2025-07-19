{ config, lib, pkgs, inputs, ... }:

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
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [

    "spotify"
    
  ];
  fonts.packages = with pkgs; [
    ipafont
  ];

}
