{ config, pkgs, ... }:

{
  # Get ready for flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
  ];

  # Enable zsh
  programs.zsh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure console keymap
  console.keyMap = "de";

  # Make zsh default shell
  users.defaultUserShell = pkgs.zsh;

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
    nano
    htop
    curl
    wget
    git
    git-lfs
    git-crypt
    gnupg
  ];

}
