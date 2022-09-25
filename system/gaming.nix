{ config, pkgs, ...}:{
  imports = [
    ./gaming/wine.nix
    ./gaming/lutris.nix
    ./gaming/steam.nix
    ./gaming/minecraft.nix
  ];
  environment.variables = {
    SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "0";
  };
}
