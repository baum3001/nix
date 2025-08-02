{ inputs, config, pkgs, lib, ... }:

{
imports = [

  inputs.spicetify-nix.homeManagerModules.default

];
 nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "spotify"
  ];
programs.spicetify =
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  enable = true;

  enabledExtensions = with spicePkgs.extensions; [
    adblock
    hidePodcasts
    shuffle # shuffle+ (special characters are sanitized out of extension names)
  ];
  enabledCustomApps = with spicePkgs.apps; [
    newReleases
    ncsVisualizer
  ];
  enabledSnippets = with spicePkgs.snippets; [
    rotatingCoverart
    pointer
  ];

  theme = spicePkgs.themes.catppuccin;
  colorScheme = "mocha";
};
}
