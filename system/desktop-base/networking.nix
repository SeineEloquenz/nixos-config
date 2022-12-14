{ config, pkgs, ... }:{

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Secrets
  networking.networkmanager.generic-networks = [
    "MondcarionGroup"
    "MondcarionMOBILE"
    "rednose"
    "Schwarzwaldklick"
    "Karl7"
    "KA-sWLAN"
    "KIT"
    "eduroam"
    "KIT-VPN"
  ];
}
