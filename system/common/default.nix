{ config, pkgs, ... }:

{
  imports = [
    ./sops.nix
    ./systemd.nix
    ./ssh.nix
    ./zsh.nix
    ./git.nix
  ];


  boot.kernelPackages = pkgs.linuxPackages_latest;
  nix = {
    settings.auto-optimise-store = true;
    package = pkgs.nixUnstable;
    # for nix-direnv, flakes
    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations
    '';
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };
    settings = {
      trusted-substituters = [
        "http://nix-cache.internal.mondcarion.group:5000"
      ];
      trusted-public-keys = [
        "mcg-cache:3LM/byAOLl7mi6Dj78jpbbf6ZqK3C/S6II84fI2zM58="
      ];
    };
  };

  # Set nano as EDITOR
  environment.sessionVariables = {
    EDITOR = "nano";
  };

  # Set zsh as shell
  environment.shells = [ pkgs.zsh ];

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
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAG2dlvxsK8sFLZaqupo3mqEU2llLMkep87cwW9Zu77lBRdPI7X/UOWV5rFToOD/gprWeNNM2Y/a4GCI1jc1X3QYhgHwkf+3odCYYy+0YT/pxjwl3XTKb05bJlOaK07j3j/XZoDMEgfgb+Ma7gQJOqL9qBA9mg6kYNOXSTkz4Wq2KgOjcQ== alexa@mcg-pres"
    ];
  };

  home-manager.users.alexa = {
    home.username = "alexa";
    home.homeDirectory = "/home/alexa";

    nixpkgs.config.allowUnfree = true;
    xdg.configFile."nixpkgs/config.nix".text = ''
      { allowUnfree = true; }
    '';

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

  };

  # Common packages

  environment.systemPackages = with pkgs; [
    # base
    lm_sensors
    nano
    tree
    htop
    iotop
    btop
    curl
    wget
    git
    git-lfs
    unrar
    unzip
    # networking
    dig
    tcpdump
    iputils
    # tools
    imagemagick
    ncdu
    tldr
  ];

  # Fonts

  fonts.fonts = with pkgs; [
    noto-fonts
    roboto
    roboto-mono
    emojione
    montserrat
    (nerdfonts.override { fonts = ["RobotoMono"]; })
  ];
  fonts.enableDefaultFonts = true;
  fonts.fontconfig.defaultFonts = {
    monospace = ["RobotoMono Nerd Font"];
    sansSerif = ["Montserrat Bold"];
    serif = ["Noto Serif"];
  };
}
