{ config, lib, pkgs, ... }:
with lib;

let
  vars = {
    QT_STYLE_OVERRIDE = "kvantum";
  };
  layanWallpaper = ../../files/wallpaper.png;
  layanEnv = pkgs.buildEnv {
    name = "layanEnv";
    paths = [
      pkgs.layan-gtk-theme
      (pkgs.runCommand "wallpaper" {} ''
        mkdir -p $out/share/themes/Layan-Dark/gnome-shell/assets
        ln -s ${layanWallpaper} $out/share/themes/Layan-Dark/gnome-shell/assets/wallpaper.png
      '')
    ];
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
    package = layanEnv;
  };
  xdg.configFile."gtk-4.0/gtk.css".source = "${layanEnv}/share/themes/Layan-dark/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/assets" = {
    source = "${layanEnv}/share/themes/Layan-dark/gtk-4.0/assets";
    recursive = true;
  };

  gtk.font = {
    name = "Montserrat SemiBold";
    package = pkgs.montserrat;
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
  ];

}
