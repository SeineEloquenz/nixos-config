{ config, pkgs, ... }:

{
  imports = [
      # Import base modules
      ../../system/docker.nix
      ../../system/gnome
      ../../system/gaming
      ../../system/idrac.nix
      ../../system/apps/office.nix
      ../../system/apps/dev.nix
      ../../system/apps/art.nix
    ];

  powerManagement.cpuFreqGovernor = "performance";

  networking.networkmanager = {
    generic-networks = [
      "Wired connection 1"
    ];
    specific-networks = [
      "MCG-VPN"
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

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

