{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    
    comic-code-ligatures-nerd-font = {
      url = "github:juliuskreutz/ComicCodeLigaturesNerdFont";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Shell
    caelestia = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Shell
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = inputs: 
    let
      inherit (inputs.nixpkgs) lib;

      hostDefs = [
        {
          name = "nix-heizluefter";
          path = ./hosts/nix-heizluefter;
        }
        {
          name = "nix-surface";
          path = ./hosts/surface;
        }
        {
          name = "nix-desktop";
          path = ./hosts/desktop;
        }
      ];
    in {
      nixosConfigurations = lib.listToAttrs (map (host:
        {
          name = host.name;
          value = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs;
              configName = host.name;
            };
            modules = [
              { networking.hostName = host.name; }
              host.path
              inputs.sops-nix.nixosModules.sops
              ./nixconfig
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = { 
                    hostPath = host.path;
                    inherit inputs; 
                  };
                  users.baum.imports = [ ./home ];
                };
              }
            ];
          };
        }) hostDefs);
    };
}
