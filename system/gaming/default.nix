{ config, pkgs, ...}:{
  imports = [
    ./wine.nix
    ./lutris.nix
    ./steam.nix
    ./minecraft.nix
    ./playstation.nix
  ];
  environment.variables = {
    SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "0";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
  };
}
