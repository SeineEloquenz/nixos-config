{ config, pkgs, ... }:{

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Secrets
  networking.networkmanager.networks = [
    "MondcarionGroup"
    "MondcarionMOBILE"
    "rednose"
    "Karl7"
    "KA-sWLAN"
    "KIT-VPN"
  ];
}
