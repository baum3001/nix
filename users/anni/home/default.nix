{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:

{
  imports = [
    ./keybinds.nix
    ../../../home/programs
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.username = "anni";
  home.homeDirectory = "/home/anni";
  home.stateVersion = "25.05";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    cursors.enable = false;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "mocha";
        size = "compact";
      };
    };
  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

  programs.kitty.settings.font_size = 10;

  programs.git = {
    userName = "Anni";
    userEmail = "anni@sometree.dev";

    signing.signByDefault = true;

    extraConfig.push.autoSetupRemote = true;
  };

  xdg.configFile."helix/config.toml".text = ''
    theme = "catppuccin_mocha"
  '';
}
