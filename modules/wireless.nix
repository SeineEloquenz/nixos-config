{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.networking.networkmanager;

  createWifi = ssid: {
    name = "wifi/${ssid}";
    value = {
      owner = "root";
      path = "/etc/NetworkManager/system-connections/${ssid}.nmconnection";
      sopsFile = ./../.secrets/wifi.yaml;
    };
  };

  sopsWifis = listToAttrs (map createWifi config.networking.networkmanager.networks);
in {

  options.networking.networkmanager = {
    networks = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    sops.secrets = sopsWifis;
  };
}
