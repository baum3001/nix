{ inputs, config, pkgs,  lib, ...}:
{
  programs.vesktop = lib.mkDefault {
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
        FakeNitro.enabled = true;
      };
      
    };
}
