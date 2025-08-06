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

  users.users.baum = {
    isNormalUser = true;
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
