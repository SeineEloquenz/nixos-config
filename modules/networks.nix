{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.networking.networkmanager;

  createNetwork = ssid: {
    name = "network/${ssid}";
    value = {
      owner = "root";
      path = "/etc/NetworkManager/system-connections/${ssid}.nmconnection";
      sopsFile = ./../.secrets/networks.yaml;
    };
  };

  sopsNetworks = listToAttrs (map createNetwork config.networking.networkmanager.networks);
in {

  options.networking.networkmanager = {
    networks = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    sops.secrets = sopsNetworks;
  };
}
