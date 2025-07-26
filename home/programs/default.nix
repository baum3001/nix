{ inputs, config, pkgs,  ...}:

{

    imports = [
      ./librewolf.nix
      ./spicetify.nix
      ./shell.nix
  ];
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium.fhs;
      profiles.default = {

        extensions = with pkgs.vscode-extensions; [
          pkief.material-icon-theme
          esbenp.prettier-vscode
          bradlc.vscode-tailwindcss
          bbenoist.nix
        ];
        userSettings = {
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.colorTheme" = "Catppuccin Mocha";
          "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
          "editor.formatOnSave" = true;
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[css]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };
    };
  };    
    wofi = {
      enable = true;    

    };
    
    vesktop = {
      enable = true;
      settings = {
        arRPC = true;
        disableMinSize = true;
        hardwareAcceleration = true;
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          FakeNitro.enabled = true;
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

    git = {
      enable = true;
      userEmail = "sometree@sometree.dev";
      userName = "Baum";
      signing = {
        signByDefault = true;
      };
      extraConfig.push.autoSetupRemote = true;
    };
    spotify-player = {
      enable = true;
    };
    lutris = {
      enable = true;
    };
  };


  
  # fonts

  fonts.fontconfig.enable = true;



  home.packages = with pkgs; [
    gcr
    qpwgraph
    pavucontrol
    feishin
    gotop
    signal-desktop
    filezilla
    tree
    fractal
    gimp3
    fastfetch
    jellyfin-tui
    altus
    scrcpy
    bitwarden-desktop
    kdePackages.dolphin
    nerd-fonts.fira-code
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font

  ];

  services = {
    gnome-keyring.enable = true;
    hyprpolkitagent.enable = true;
    
    udiskie = {
      enable = true;
      settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin/";
        };
      };
    };
  };

}