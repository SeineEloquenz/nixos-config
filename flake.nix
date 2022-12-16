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
    juso-motion-template = {
      url = "github:SeineEloquenz/juso-motion-template";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    idrac-6 = {
      url = "github:SeineEloquenz/idrac-6-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.sops-nix.follows = "sops-nix";
    };
  };

  outputs = inputs@{ self, nixpkgs, sops-nix, home-manager, juso-motion-template, idrac-6 }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };  
        overlays = [
          (import ./overlays/layan.nix)
          (import ./overlays/nextcloud-client.nix)
          (import ./pkgs)
          ( self: super:  {
            juso-motion-template = inputs.juso-motion-template.packages.${system}.juso-motion-template;
          })
        ];
      };
      lib = nixpkgs.lib;
      defaultModules = [
        sops-nix.nixosModules.sops
        idrac-6.nixosModules.idrac-6
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
        # Our modules
        ./modules/kubernetes.nix
        ./modules/ssh-keys.nix
        ./modules/networks.nix
        ./modules/prismlauncher.nix
        # Our packages
        ./pkgs/steam-adwaita
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
        mcggenesis = mkSystem "mcggenesis";
        mcgpres = mkSystem "mcgpres";
        mcgzen = mkSystem "mcgzen";
        surface = mkSystem "surface";
      };
    };
}
