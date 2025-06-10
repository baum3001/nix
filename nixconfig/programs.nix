{ config, lib, pkgs, ... }:

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
  };


}
