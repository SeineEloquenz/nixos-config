{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.networking.networkmanager;

  createSecret = secretName: ssid: {
    name = "network/${secretName}";
    value = {
      owner = "root";
      path = "/etc/NetworkManager/system-connections/${ssid}.nmconnection";
      sopsFile = ./../secrets/networks.yaml;
    };
  };

  createGeneric = ssid: createSecret ssid ssid;

  createSpecific = name: createSecret ("${config.networking.hostName}-" + name) name;


  sopsGenerics = listToAttrs (map createGeneric config.networking.networkmanager.generic-networks);
  sopsSpecifics = listToAttrs (map createSpecific config.networking.networkmanager.specific-networks);
in {

  options.networking.networkmanager = {
    generic-networks = mkOption {
      type = with types; listOf str;
      default = [];
    };
    specific-networks = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    sops.secrets = recursiveUpdate sopsGenerics sopsSpecifics;
  };
}
