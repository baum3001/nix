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

  users.users.teliax = {
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
