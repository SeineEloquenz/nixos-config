# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./drives.nix
      ./scaling.nix
      # Import base modules
      ../../system/thermald.nix
      ../../system/iio.nix
      ../../system/gnome
      ../../system/gnome/disable-tracker.nix
      ../../system/wireguard.nix
      # Apps
      ../../system/idrac.nix
      ../../system/apps/office.nix
    ];

  networking.networkmanager.networks = [
    "MCG-surface-VPN"
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
  boot.initrd.luks.devices."luks-4e7c8ffd-96e3-4248-bf00-f02b6152b8b3".device = "/dev/disk/by-uuid/4e7c8ffd-96e3-4248-bf00-f02b6152b8b3";
  boot.initrd.luks.devices."luks-4e7c8ffd-96e3-4248-bf00-f02b6152b8b3".keyFile = "/crypto_keyfile.bin";

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
