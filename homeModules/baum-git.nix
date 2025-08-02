{ config, pkgs, inputs, lib,... }:
{
programs.git = {
  enable = true;
  userEmail = "sometree@sometree.dev";
  userName = "Baum";
  signing = {
    signByDefault = true;
  };
  extraConfig.push.autoSetupRemote = true;
};
}