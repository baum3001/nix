{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./sshkeys.nix
    ./packages.nix
  ];

  users.users.leouar = {
    isNormalUser = true;
    description = "Attila";
    extraGroups = [
      "wheel"
      "networkmanager"
      "disk"
      "adbusers"

    ];
    packages = with pkgs; [
      wget
    ];
  };
}
