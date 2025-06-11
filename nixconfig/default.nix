# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./services.nix
      ./programs.nix
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

  networking = {
    hostName = "baum-surface-nix";
    networkmanager = {
      enable = true;
    };
  };


  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };
  
  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    experimental-features = "nix-command flakes";
  };
  
  hardware.graphics.enable = true;
   
  
  home-manager.backupFileExtension = "backup";

  users.users.baum = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"

    ]; 
    packages = with pkgs; [
      tree
      fractal
      fastfetch
      finamp
    ];
  };

  # hopefully get electron to work

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    wget
    bitwarden-desktop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  system.stateVersion = "25.05"; # Did you read the comment?

}

