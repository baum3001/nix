{ config, pkgs, inputs, lib,... }:

{
  home.packages = with pkgs ;[
    inputs.caelestia.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default
  ];
}