{
  description = "My NixOS system configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, sops-nix, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      lib = nixpkgs.lib;
      defaultModules = [
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
        # Our modules
        ./modules/ssh-keys.nix
        ./modules/wireless.nix
        # Common Components
        ./system/common
      ];
      mkSystem = name: nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = defaultModules ++ [
          ./hosts/${name}/configuration.nix
          ./hosts/${name}/hardware-configuration.nix
          {
            networking.hostName = name;
          }
        ];
      };
    in {
      nixosConfigurations = {
        mcgpres = mkSystem "mcgpres";
        mcgzen = mkSystem "mcgzen";
        surface = mkSystem "surface";
      };
    };
}
