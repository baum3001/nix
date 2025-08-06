# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, lib, ... }:

{
  imports =
    [
      inputs.nixos-hardware.nixosModules.apple-macbook-pro-11-5
      inputs.nixos-hardware.nixosModules.common-gpu-amd-southern-islands
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "cryptd" ];
  boot.kernelModules = [ "kvm-intel" "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.blacklistedKernelModules = [ "bcma" ];

  boot.extraModprobeConfig = ''
      options hid_apple iso_layout=1
    '';

  boot.initrd.luks.devices."jabolkovo".device = "/dev/disk/by-label/jabolkovo";

  fileSystems."/" =
    { device = "/dev/disk/by-label/jabolkovo-root";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/jabolkovo-home";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/NIXOS-BOOT";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/jabolkovo-swap"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware; 

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "broadcom-sta"
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-57-6.12.41"
  ];

  hardware.graphics.enable = true;

  system.stateVersion = "25.05";

  services.mbpfan.settings.general = {
    low_temp = 40;
    high_temp = 50;
    max_temp = 84;

    polling_interval = 1;

    fan_min = 2000;
    fan_max = 6156;
  };

}
