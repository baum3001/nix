{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  users.users.leouar.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    nextcloud-client

    signal-desktop

    lutris
    vlc
    gimp3
    altus
    scrcpy
    bitwarden-desktop
    fluffychat
  ];
}
