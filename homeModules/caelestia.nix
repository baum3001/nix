{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{

  # caelestia config

  home.packages = with pkgs; [
    inputs.caelestia.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default
    # dependencies
    cliphist
    wl-clipboard

  ];

  home.file.".config/caelestia/shell.json".text = ''
        {
        "appearance": {
            "anim": {
                "durations": {
                    "scale": 1
                }
            },
            "font": {
                "family": {
                    "material": "Material Symbols Rounded",
                    "mono": "CaskaydiaCove NF",
                    "sans": "Rubik"
                },
                "size": {
                    "scale": 1
                }
            },
            "padding": {
                "scale": 1
            },
            "rounding": {
            	"scale": 1
            },
            "spacing": {
                "scale": 1
            },
            "transparency": {
                "enabled": false,
                "base": 0.85,
                "layers": 0.4
            }
        },
        "general": {
            "apps": {
                "terminal": ["foot"],
                "audio": ["pavucontrol"]
            }
        },
        "background": {
            "desktopClock": {
                "enabled": false
            },
            "enabled": true
        },
        "bar": {
            "dragThreshold": 20,
            "entries": [
            	{
       	            "id": "logo",
       	            "enabled": true
       	        },
       	        {
       	            "id": "workspaces",
       	            "enabled": true
       	        },
       	        {
       	            "id": "spacer",
       	            "enabled": true
       	        },
       	        {
       	            "id": "activeWindow",
       	            "enabled": true
       	        },
       	        {
       	            "id": "spacer",
       	            "enabled": true
       	        },
       	        {
       	            "id": "tray",
       	            "enabled": true
       	        },
       	        {
       	            "id": "clock",
       	            "enabled": true
       	        },
       	        {
       	            "id": "statusIcons",
       	            "enabled": true
       	        },
       	        {
       	            "id": "power",
       	            "enabled": true
       	        },
       	        {
       	            "id": "idleInhibitor",
       	            "enabled": true
       	        }
            ],
            "persistent": true,
            "showOnHover": true,
            "status": {
                "showAudio": true,
                "showBattery": true,
                "showBluetooth": true,
                "showKbLayout": true,
                "showNetwork": true
            },
            "tray": {
                "background": false,
                "recolour": false
            },
            "workspaces": {
                "activeIndicator": true,
                "activeLabel": "󰮯",
                "activeTrail": false,
                "label": "  ",
                "occupiedBg": false,
                "occupiedLabel": "󰮯",
                "perMonitorWorkspaces": true,
                "showWindows": true,
                "shown": 5
            }
        },
        "border": {
            "rounding": 10,
            "thickness": 10
        },
        "dashboard": {
            "enabled": true,
            "dragThreshold": 50,
            "mediaUpdateInterval": 500,
            "showOnHover": false,
            "visualiserBars": 45
        },
        "launcher": {
            "actionPrefix": ".",
            "dragThreshold": 50,
            "vimKeybinds": false,
            "enableDangerousActions": false,
            "maxShown": 8,
            "maxWallpapers": 9,
            "specialPrefix": "@",
            "useFuzzy": {
                "apps": false,
                "actions": false,
                "schemes": false,
                "variants": false,
                "wallpapers": false
            }
        },
        "lock": {
            "recolourLogo": true
        },
        "notifs": {
            "actionOnClick": false,
            "clearThreshold": 0.3,
            "defaultExpireTimeout": 5000,
            "expandThreshold": 20,
            "expire": true
        },
        "osd": {
            "hideDelay": 2000
        },
        "paths": {
            "mediaGif": "root:/assets/bongocat.gif",
            "sessionGif": "root:/assets/kurukuru.gif",
            "wallpaperDir": "~/Pictures/Wallpapers"
        },
        "services": {
            "audioIncrement": 0.1,
            "defaultPlayer": "Spotify",
            "playerAliases": [{
                "com.github.th_ch.youtube_music": "YT Music"
            }],
            "weatherLocation": "",
            "useFahrenheit": false,
            "useTwelveHourClock": false,
            "smartScheme": true
        },
        "session": {
            "dragThreshold": 30,
            "vimKeybinds": false,
            "commands": {
                "logout": ["loginctl", "terminate-user", ""],
                "shutdown": ["systemctl", "poweroff"],
                "hibernate": ["systemctl", "suspend"],
                "reboot": ["systemctl", "reboot"]
            }
        }
    }
  '';

  # Hyprland config
  wayland.windowManager.hyprland.settings = {

    # gesture config
    gestures = {
      workspace_swipe = true;

    };

    # exec
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "systemctl --user start swayosd"
      "caelestia shell -d"
      "foot --server"
      "exec-once = wl-paste --type text --watch cliphist store # Stores only text data"
      "exec-once = wl-paste --type image --watch cliphist store # Stores only image data"
    ];
    general = {
      gaps_in = "1";
      gaps_out = "0";
      border_size = "0";
      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = "false";
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = "false";
      layout = "dwindle";
    };
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 0;
      rounding_power = 2;
      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        # color = "rgba(1a1a1aee)";
      };
      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = true;
      # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];
      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };
    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      session_lock_xray = true;
    };
    dwindle =
      let
        ALWAYS_EAST = 2;
      in
      {
        force_split = ALWAYS_EAST;
        preserve_split = true;
      };
  };
}
