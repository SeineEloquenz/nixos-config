{ config, pkgs, ... } : {
  imports = [ <sops-nix/modules/sops> ];
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  #sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../.secrets/secrets.yaml;
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/root/keys.txt";

  # This is the actual specification of the secrets.

  # WireGuard secrets
  sops.secrets."wg/mcg" = {
    owner = "root";
  };

  # Wifi networks

  sops.secrets."wifi/MondcarionGroup" = {
    owner = "root";
    path = "/etc/NetworkManager/system-connections/MondcarionGroup.nmconnection";
  };
}
