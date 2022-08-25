{ config, pkgs, ... }:{
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    steam-run-native
    protonup
    protontricks
  ];
}
