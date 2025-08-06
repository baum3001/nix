{ config, lib, pkgs, inputs, ... }:
{
  users.users.kruemmelspalter.packages = with pkgs; [
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
  ];
}
