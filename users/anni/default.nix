{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./networking.nix
    ./packages.nix
  ];

  users.users.anni = {
    isNormalUser = true;
    description = "Anni";
    extraGroups = [
      "networkmanager"
      "disk"
      "adbusers"

    ];
  };
}
