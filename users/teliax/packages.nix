{ config, lib, pkgs, inputs, ... }:
{
  users.users.teliax.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    nextcloud-client
    qpwgraph
    feishin
    signal-desktop
    filezilla
    fractal
    gimp3
    altus
    scrcpy
    bitwarden-desktop
    firefox
    fluffychat
    openvpn
  ];
}
