{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./drives.nix
      ./audio.nix
      # Import base modules
      ../../common.nix
      ../../docker.nix
      ../../nvidia.nix
      ../../gnome
      ../../gaming
      ../../apps/office.nix
      ../../apps/dev.nix
      ../../apps/art.nix
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

  networking.hostName = "mcgpres"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  hardware.cpu.intel.updateMicrocode = true;

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
