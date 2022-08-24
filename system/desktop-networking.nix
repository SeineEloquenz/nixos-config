{ config, pkgs, ... }:{

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Secrets

  sops.secrets."wifi/MondcarionGroup" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/MondcarionGroup.nmconnection";
  };

  sops.secrets."wifi/MondcarionMOBILE" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/MondcarionMOBILE.nmconnection";
  };

  sops.secrets."wifi/rednose" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/rednose.nmconnection";
  };
}
