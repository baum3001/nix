{ inputs, config, pkgs,  ...}:
{
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
      font_size = 13;
      font_family = "FiraCode Nerd Font";
      shell = "fish";
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.5";
      background_blur = 5;
      symbol_map = let
        mappings = [
          "U+23FB-U+23FE"
          "U+2B58"
          "U+E200-U+E2A9"
          "U+E0A0-U+E0A3"
          "U+E0B0-U+E0BF"
          "U+E0C0-U+E0C8"
          "U+E0CC-U+E0CF"
          "U+E0D0-U+E0D2"
          "U+E0D4"
          "U+E700-U+E7C5"
          "U+F000-U+F2E0"
          "U+2665"
          "U+26A1"
          "U+F400-U+F4A8"
          "U+F67C"
          "U+E000-U+E00A"
          "U+F300-U+F313"
          "U+E5FA-U+E62B"
        ];
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
    };
  };
  };
}