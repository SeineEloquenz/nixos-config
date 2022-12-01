{ config, pkgs, ... }:

let nix-serve = pkgs.haskellPackages.nix-serve-ng;

in {
  services.nix-serve = {
    enable = true;
    package = nix-serve;
  };
}
