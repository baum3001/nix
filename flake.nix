{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =  {self, nixpkgs, home-manager, hyprland, ...}@inputs: {
    nixosConfigurations = {
      baum-surface-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixconfig
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.baum = ./home;
          }
        ];
      };
    };
  };
}
