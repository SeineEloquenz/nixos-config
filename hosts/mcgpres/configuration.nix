{ config, pkgs, ... }:

{
  imports = [
      ./drives.nix
      ./audio.nix
      # Import base modules
      ../../system/docker.nix
      ../../system/nvidia.nix
      ../../system/gnome
      ../../system/gaming
      ../../system/idrac.nix
      ../../system/apps/office.nix
      ../../system/apps/dev.nix
      ../../system/apps/art.nix
    ];

  powerManagement.cpuFreqGovernor = "schedutil";

  networking.networkmanager = {
    generic-networks = [
      "Wired connection 1"
    ];
    specific-networks = [
      "MCG-VPN"
    ];
  };

  boot.kernelParams = [
    "iommu=pt"
    "amd_iommu=on"
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
  boot.initrd.luks.devices."luks-075b0e5a-44d0-4383-b496-8763d1ef4875".device = "/dev/disk/by-uuid/075b0e5a-44d0-4383-b496-8763d1ef4875";
  boot.initrd.luks.devices."luks-075b0e5a-44d0-4383-b496-8763d1ef4875".keyFile = "/crypto_keyfile.bin";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  home-manager.users.alexa = {
    home.stateVersion = "22.11";
  };
}
