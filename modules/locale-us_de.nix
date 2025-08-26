{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  time.timeZone = lib.mkDefault "Europe/Berlin";
  services.automatic-timezoned.enable = lib.mkDefault true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "en_US.UTF8";
    LC_ADDRESS = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
    LC_COLLATE = "de_DE.UTF-8";
  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };
}
