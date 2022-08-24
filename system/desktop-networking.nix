{ config, pkgs, ... }:{

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Secrets

  sops.secrets."wifi/MondcarionGroup" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/MondcarionGroup.nmconnection";
    sopsFile = ../.secrets/wifi.yaml;
  };

  sops.secrets."wifi/MondcarionMOBILE" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/MondcarionMOBILE.nmconnection";
    sopsFile = ../.secrets/wifi.yaml;
  };

  sops.secrets."wifi/rednose" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/rednose.nmconnection";
    sopsFile = ../.secrets/wifi.yaml;
  };
}
