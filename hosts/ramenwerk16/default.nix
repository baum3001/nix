# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-62845fd6-9c83-45af-8d48-9a6226ec36e3".device = "/dev/disk/by-uuid/62845fd6-9c83-45af-8d48-9a6226ec36e3";


  # Enable networking

  system.stateVersion = "25.05"; # Did you read the comment?

}
