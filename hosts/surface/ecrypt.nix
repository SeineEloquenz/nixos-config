{ config, pkgs, ... }:{
  environment.systemPackages = [
    ecryptfs
    ecryptfs-helper
  ];
  security.pam.enableEcryptfs = true;
}
