{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      disableMinSize = true;
      hardwareAcceleration = true;
    };

    vencord.settings.plugins = {
      MessageLogger = {
        enabled = true;
        ignoreSelf = true;
      };
      petpet.enabled = lib.mkDefault true;
      PictureInPicture.enabled = lib.mkDefault true;
      ShowMeYourName.enabled = lib.mkDefault true;
      UserMessagesPronouns.enabled = lib.mkDefault true;
      NoProfileThemes.enabled = lib.mkDefault true;
      AlwaysExpandRoles.enabled = lib.mkDefault true;
      FakeNitro.enabled = true;
    };

  };
}
