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

  theming = {
    enable = true;
    qtTheme = {
      name = "Layan-Dark";
      kvantumName = "LayanSolidDark";
      package = pkgs.layan-kde;
    };
    gtkTheme = {
      name = "Orchis-Pink-Dark-Compact";
      package = pkgs.orchis-gtk;
    };
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
    iconTheme = {
      name = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };
    font = {
      name = "Montserrat SemiBold";
      package = pkgs.montserrat;
    };
  };

  environment.systemPackages = with pkgs; [
    # Gnome Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.espresso
    gnomeExtensions.gsconnect
    gnomeExtensions.ddterm
    gnomeExtensions.vitals
    gnomeExtensions.nothing-to-say
    # Gnome Software
    gnome.gnome-terminal
    gnome.gnome-tweaks
    gnome-firmware
    # Third Party software
    baobab
    gparted
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
