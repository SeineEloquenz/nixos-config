{ config, pkgs, ... }:{

  environment.systemPackages = [
    wine
    winetricks
  ];
}
