{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    logiops
  ];

  systemd.services.logid = {
    description = "Logitech Configuration Daemon";
    after = [ "multi-user.target" ];
    wants = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "/run/current-system/sw/bin/logid"; 
      User = "root";
    };
    wantedBy = [ "graphical.target" ];
    restartTriggers = [ config.environment.etc."logid.cfg".source ];
  };

  environment.etc."logid.cfg".text = ''
devices: ({
  name: "MX Master 3S";

  smartshift: {
    on: true;
    threshold: 15;
  };

  hiresscroll: {
    hires: false;
    invert: false;
    target: false;
  };
  thumbwheel: {
    invert: true;
  };

  dpi: 1500; // max=4000

  buttons: (
    // Forward button
    {
      cid: 0x56;
      action = {
        type: "Gestures";
        gestures: (
          {
            direction: "None";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_FORWARD" ];
            }
          },

          {
            direction: "Up";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_PLAYPAUSE" ];
            }
          },

          {
            direction: "Down";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA" ];
            }
          },

          {
            direction: "Right";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_NEXTSONG" ];
            }
          },

          {
            direction: "Left";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_PREVIOUSSONG" ];
            }
          }
        );
      };
    },

    // Back button
    {
      cid: 0x53;
      action = {
        type: "Gestures";
        gestures: (
          {
            direction: "None";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_BACK" ];
            }
          }
        );
      };
    },

    // Gesture button (hold and move)
    {
      cid: 0xc3;
      action = {
        type: "Gestures";
        gestures: (
          {
            direction: "None";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA" ]; // open activities overview
            }
          },

          {
            direction: "Right";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_RIGHT" ]; // snap window to right
            }
          },

          {
            direction: "Left";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_LEFT" ];
            }
		  },

		  {
            direction: "Up";
            mode: "onRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_UP" ]; // maximize window
            }
		  },
		  
		  {
            direction: "Down";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_DOWN" ]; // minimize window
            }
          }
        );
      };
    },
	
    // Top button
    {
      cid: 0xc4;
      action = {
        type: "Gestures";
        gestures: (
          {
            direction: "None";
            mode: "OnRelease";
            action = {
              type: "ToggleSmartShift";
            }
          },

          {
            direction: "Up";
            mode: "OnRelease";
            action = {
              type: "ChangeDPI";
              inc: 500,
            }
          },

          {
            direction: "Down";
            mode: "OnRelease";
            action = {
              type: "ChangeDPI";
              inc: -500,
            }
          }
        );
      };
    }
  );
});

  '';
}
