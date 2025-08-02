{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";
    nari.url = "github:sodiboo/nixos-razer-nari";

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

    # Define individual host configurations
    nixosConfigurations = {
      nix-heizluefter = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          configName = "nix-heizluefter";
        };
        modules = [
          { networking.hostName = "nix-heizluefter"; }
          ./nixconfig
          ./hosts/nix-heizluefter
          ./modules/locale_de.nix
          ./modules/steam.nix
          ./modules/openssh.nix
          ./users/baum
          
          inputs.sops-nix.nixosModules.sops
          inputs.nari.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { 
                inherit inputs; 
              };
              users.baum.imports = [ 
                ./home/baum.nix
                ./homeModules/caelestia.nix
                ./homeModules/baum-git.nix
                ./hosts/nix-heizluefter/home
                ./users/baum/home
              ];
            };
          }
        ];
      };

      nix-surface = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          configName = "nix-surface";
        };
        modules = [
          { networking.hostName = "nix-surface"; }
          ./nixconfig
          ./hosts/surface
          ./modules/locale_de.nix
          ./modules/steam.nix
          ./modules/openssh.nix
          ./users/baum
          inputs.sops-nix.nixosModules.sops
          
          inputs.nari.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { 
                inherit inputs; 
              };
              users.baum.imports = [
                 ./home/baum.nix
                 ./homeModules/caelestia.nix
                 ./homeModules/baum-git.nix
                 ./hosts/surface/home
                 ./users/baum/home
              ];
            };
          }
        ];
      };

      nix-desktop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          configName = "nix-desktop";
        };
        modules = [
          { networking.hostName = "nix-desktop"; }
          ./hosts/desktop
          ./modules/locale_de.nix
          ./modules/steam.nix
          ./modules/openssh.nix
          ./users/baum
          inputs.sops-nix.nixosModules.sops
          ./nixconfig
          inputs.nari.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { 
                
                inherit inputs; 
              };
              users.baum.imports = [
                 ./home/baum.nix
                 ./homeModules/caelestia.nix
                 ./homeModules/baum-git.nix
                 ./hosts/desktop/home
                 ./users/baum/home
              ];
            };
          }
        ];
      };

      nix-t430 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          configName = "nix-t430";
        };
        modules = [
          { networking.hostName = "nix-t430"; }
          ./hosts/nix-t430
          ./modules/locale_de.nix
          ./modules/steam.nix
          ./modules/openssh.nix
          ./users/baum
          inputs.sops-nix.nixosModules.sops
          ./nixconfig
          inputs.nari.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { 
                
                inherit inputs; 
              };
              users.baum.imports = [
                 ./home/baum.nix
                 ./homeModules/caelestia.nix
                 ./homeModules/baum-git.nix
                 ./hosts/nix-t430/home
                 ./users/baum/home
              ];
            };
          }
        ];
      };


      schlaeptop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          configName = "schlaeptop";
        };
        modules = [
          { networking.hostName = "schlaeptop"; }
          ./hosts/schlaeptop
          ./modules/locale_de.nix
          ./modules/steam.nix
          ./modules/openssh.nix
          inputs.sops-nix.nixosModules.sops
          ./nixconfig
          ./users/teliax
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {

                inherit inputs;
              };
              users.teliax.imports = [
                 ./home/teliax.nix
                 ./homeModules/caelestia.nix
                 ./homeModules/teliax-git.nix
                 ./hosts/schlaeptop/home
                 ./users/teliax/home
              ];
            };
          }
        ];
      };
    };

  in {
    nixosConfigurations = nixosConfigurations;
  };

}
