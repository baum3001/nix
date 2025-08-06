{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  users.users.kruemmelspalter = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "disk"
      "adbusers"
    ];

    packages = with pkgs; [
      helix
      btop
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_DE
      nextcloud-client
      signal-desktop
      gimp3
      altus
      scrcpy
      bitwarden-desktop
      fluffychat
      unzip
      nixfmt
      jq
    ];
  };
}
