# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      # Import base modules
      ../../system/iio.nix
      ../../system/gnome
      ../../system/wireguard.nix
      ../../system/gnome/disable-tracker.nix
      # Apps
      ../../system/apps/office.nix
      ../../system/apps/dev.nix
      ../../system/apps/art.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-b88b46e4-d105-4a66-ab9c-25ff608d16b4".device = "/dev/disk/by-uuid/b88b46e4-d105-4a66-ab9c-25ff608d16b4";
  boot.initrd.luks.devices."luks-b88b46e4-d105-4a66-ab9c-25ff608d16b4".keyFile = "/crypto_keyfile.bin";

  boot.kernelModules = [ "coretemp" ];

  services.thermald.enable = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
  home-manager.users.alexa = {
    home.stateVersion = "22.05";
  };
}