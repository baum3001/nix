{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

}
