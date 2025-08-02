{ config, pkgs, inputs, lib,... }:
{
programs.git = {
  enable = true;
  userEmail = "teliax@proton.me";
  userName = "Teliax";
  signing = {
    signByDefault = false;
  };
  extraConfig.push.autoSetupRemote = true;
};
}
