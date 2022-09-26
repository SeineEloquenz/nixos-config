{ config, lib, pkgs, ... }:
with lib;

let
  vars = {
    QT_STYLE_OVERRIDE = "kvantum";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
in {
  qt.enable = true;
  qt.style = {
    name = "kvantum";
  };

  home.sessionVariables = vars;
  systemd.user.sessionVariables = vars;

  xdg.configFile."Kvantum/kvantum.kvconfig".source = ~/.dotfiles/files/kvantum.kvconfig;

  gtk.enable = true;

  gtk.cursorTheme = {
    name = "Numix-Cursor";
    package = pkgs.numix-cursor-theme;
  };

  gtk.iconTheme = {
    name = "Tela-dark";
    package = pkgs.tela-icon-theme;
  };

  gtk.theme = {
    name = "Layan-dark";
    package = pkgs.layan-gtk-theme;
  };
  xdg.configFile."gtk-4.0/gtk.css".source = "${pkgs.layan-gtk-theme}/share/themes/Layan-dark/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/assets" = {
    source = "${pkgs.layan-gtk-theme}/share/themes/Layan-dark/gtk-4.0/assets";
    recursive = true;
  };

  gtk.font = {
    name = "Montserrat SemiBold";
    package = pkgs.montserrat;
  };

  home.packages = with pkgs; [
    qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];

}
