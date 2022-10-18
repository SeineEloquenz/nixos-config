{ config, pkgs, ... }:{
  programs.steam.enable = true;
  programs.steam.adwaita-theme.enable = true;
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    steam-run-native
    protonup
    protontricks
  ];
}
