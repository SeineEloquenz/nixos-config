{ config, pkgs, ... }:

{
  imports = [
    ./desktop-base.nix
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable gnome keyring in pam
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnomeExtensions.espresso
    gnomeExtensions.gsconnect
    gnomeExtensions.x11-gestures
    gnomeExtensions.dash-to-dock
    gnomeExtensions.ddterm
    gnome.gnome-terminal
  ];

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
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
