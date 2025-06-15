{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    comic-code-ligatures-nerd-font = {
      url = "github:juliuskreutz/ComicCodeLigaturesNerdFont";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: 
    let
      inherit (inputs.nixpkgs) lib;

      hostDefs = [
        {
          name = "nix-highspec";
          path = ./hosts/highspec;
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
