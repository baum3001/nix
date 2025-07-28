{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./sshkeys.nix
    ./packages.nix
  ];
}