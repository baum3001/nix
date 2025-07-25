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
        font_size = 11.0;
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

  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/ui/quickshell/config";
  };


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