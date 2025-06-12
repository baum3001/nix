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
  };

  outputs = inputs: {
    nixosConfigurations =
      let
        nixosSystem =
          surface:
          let
            hostName = if surface then "baum-surface-nix" else "baum-desktop-nix";
            hardwareConfiguration =
              if surface then ./hosts/surface.nix else ./hosts/desktop.nix;
          in
          inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs surface; };
            modules = [
              { networking.hostName = hostName; }
              hardwareConfiguration
              ./nixconfig
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  users.baum = {
                    imports = [
                      ./home
                    ];
                  };
                };
              }
            ];
          };
      in
      {
        nix-desktop = nixosSystem false;
        nix-surface = nixosSystem true;
      };
  };
}
