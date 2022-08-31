{ config, pkgs, ... }:

{
  imports = [
    ./sops.nix
  ];


  boot.kernelPackages = pkgs.linuxPackages_latest;
  nix = {
    settings.auto-optimise-store = true;
    package = pkgs.nixUnstable;
    # for nix-direnv, flakes
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  home-manager.useGlobalPkgs = true;

  # Set nano as EDITOR
  environment.sessionVariables = {
    EDITOR = "nano";
  };

  # Set zsh as shell
  environment.shells = [ pkgs.zsh ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable ssh agent
  programs.ssh.startAgent = true;

  # Open ports in the firewall.
  networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure console keymap
  console.keyMap = "de";

  # Make zsh default shell
  users.defaultUserShell = pkgs.zsh;

  # Firmware
  services.fwupd.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alexa = {
    isNormalUser = true;
    description = "Alexander Linder";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAG2dlvxsK8sFLZaqupo3mqEU2llLMkep87cwW9Zu77lBRdPI7X/UOWV5rFToOD/gprWeNNM2Y/a4GCI1jc1X3QYhgHwkf+3odCYYy+0YT/pxjwl3XTKb05bJlOaK07j3j/XZoDMEgfgb+Ma7gQJOqL9qBA9mg6kYNOXSTkz4Wq2KgOjcQ== alexa@mcg-pres"
    ];
  };

  # Common packages

  environment.systemPackages = with pkgs; [
    # base
    lm_sensors
    nano
    htop
    curl
    wget
    git
    git-lfs
    unrar
    # networking
    dig
    tcpdump
    iputils
    # tools
    imagemagick
    ncdu
    tldr
  ];

}
