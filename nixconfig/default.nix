# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./services.nix
      ./programs.nix
      inputs.catppuccin.nixosModules.catppuccin
    ];

  networking = {
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
   
  # theme

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

  home-manager.backupFileExtension = "backup";

  users.users.baum = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "disk"
      "adbusers"

    ]; 
    packages = with pkgs; [
      tree
      fractal
      fastfetch
      jellyfin-tui
      inputs.quickshell.packages.${pkgs.system}.default
    ];
  };

  # hopefully get electron to work

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    wget
    bitwarden-desktop
    wineWowPackages.staging
    inputs.caelestia-cli.packages.${pkgs.system}.default
    scrcpy
    kdePackages.partitionmanager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  networking.firewall = {
   # if packets are still dropped, they will show up in dmesg
   logReversePathDrops = true;
   # wireguard trips rpfilter up
   extraCommands = ''
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 3700 -j RETURN
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 3700 -j RETURN
   '';
   extraStopCommands = ''
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 3700 -j RETURN || true
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 3700 -j RETURN || true
   '';
  };


  system.stateVersion = "25.05"; # Did you read the comment?


}

