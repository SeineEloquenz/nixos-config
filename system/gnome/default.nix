{ config, lib, pkgs, ... }:

{
  imports = [
    ../desktop-base
    ./dconf.nix
    ./theming.nix
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.xwayland.enable = true;

  # Enable gnome keyring in pam
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.variables = lib.mkForce {
    QT_STYLE_OVERRIDE = "kvantum";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  environment.systemPackages = with pkgs; [
    # Gnome Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.espresso
    gnomeExtensions.gsconnect
    gnomeExtensions.ddterm
    gnomeExtensions.vitals
    # Gnome Software
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnome-firmware
    # Third Party software
    baobab
    gparted
    # For QT Theming
    qt5ct
  ];

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-console
  ]) ++ (with pkgs.gnome; [
    gnome-music
    epiphany # web browser
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

}
