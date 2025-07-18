{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [ 
      ./surface.nix
      ./locale.nix
    ];    

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    initrd = {
      kernelModules = ["usb_storage"];
      luks.devices.cryptroot = {
        device = "/dev/nvme0n1p2";
        preLVM = true;
      };
    };
  };
}