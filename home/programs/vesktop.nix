{ inputs, config, pkgs,  ...}:
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
        FakeNitro.enabled = true;
      };
      
    };
}