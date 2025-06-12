
{ config, lib, pkgs, inputs, ... }:

{
  services = {
    printing = {
        enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput = {
      enable = true;
    };
    openssh = {
      enable = true; 
    };
    displayManager.ly = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };
  };
}