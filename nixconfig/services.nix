
{ config, lib, pkgs, inputs, ... }:

{
  services = {
    printing = {
        enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire-pulse = {
        "disable-auto-gain" = {
          "pulse.rules" = [
            {
              matches = [ { "media.class" = "Audio/Source"; } ];
              actions = {
                quirks = [ "block-source-volume" ];
              };
            }
          ];
        };
      };
    };
    blueman = {
      enable = true;
    };
    upower = {
      enable = true;

    };
    power-profiles-daemon = {
      enable = true;
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
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}