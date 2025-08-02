{ config, pkgs, inputs, lib,... }:
{
programs.git = {
  enable = true;
  userEmail = "teliax@proton.me";
  userName = "Teliax";
  signing = {
    signByDefault = true;
  };
  extraConfig.push.autoSetupRemote = true;
};
}
