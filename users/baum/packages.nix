{ config, lib, pkgs, inputs, ... }:
{
  users.users.baum.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
  ];
}