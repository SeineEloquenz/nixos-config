{ pkgs, ... }:{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    enableNvidia = true;
    defaultNetwork.dnsname.enable = true;
  };

  environment.systemPackages = [
    pkgs.podman-compose
  ];
}
