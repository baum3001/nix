{ inputs, config, pkgs,  ...}:
{

home.packages = with pkgs; [
  fishPlugins.grc
];
  programs = {
    fish = {
    enable = true;
    interactiveShellInit = ''
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      # Manually packaging and enable a plugin
      
    ];
  };
  starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };
  kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      font_size = lib.mkDefault 13;
      font_family = "ComicCodeLigatures Nerd Font";
      shell = "fish";
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.5";
      background_blur = 5;
    };
  };
  };
}