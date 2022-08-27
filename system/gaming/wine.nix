{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    wine-staging
    winePackages.stagingFull
    winetricks
    mono
  ];
}
