{ config, pkgs, ...}:{
  imports = [
    ./gaming/wine.nix
    ./gaming/lutris.nix
    ./gaming/steam.nix
  ];
}
