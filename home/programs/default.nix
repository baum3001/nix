{ inputs, config, pkgs,  ...}:

{

    imports = [
      ./librewolf.nix
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
    altus
    kdePackages.dolphin
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font

    # quickshell
    hyprpaper
    imagemagick
    wl-clipboard
    fuzzel
    socat
    foot
    jq
    python3
    python3Packages.materialyoucolor
    grim
    wayfreeze
    wl-screenrec
    inputs.astal.packages.${pkgs.system}.default
    gtk3
    
    # Additional dependencies
    lm_sensors
    curl
    material-symbols
    nerd-fonts.jetbrains-mono
    ibm-plex
    fd
    python3Packages.pyaudio
    python3Packages.numpy
    cava
    networkmanager
    bluez
    ddcutil
    brightnessctl
  ];

  services = {
    gnome-keyring.enable = true;
    hyprpolkitagent.enable = true;
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_color = "#eceff1";
          font = "Droid Sans 9";
        };
        urgency_normal = {
          background = "#37474f";
          foreground = "#eceff1";
          timeout = 10;
        };
      };

    };
    blueman-applet = {
      enable = true;
    };
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
    swayosd = {
      enable = true;
    };
  };

}