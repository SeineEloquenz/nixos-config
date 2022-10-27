{ config, pkgs, ... }:{

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Secrets
  networking.networkmanager.generic-networks = [
    "MondcarionGroup"
    "MondcarionMOBILE"
    "rednose"
    "Karl7"
    "KA-sWLAN"
    "KIT-VPN"
  ];
}
