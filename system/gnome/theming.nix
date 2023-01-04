{ config, lib, pkgs, ... }:

with lib;

let
  buildVars = themeName: {
    QT_STYLE_OVERRIDE = "kvantum";
    GTK_THEME = themeName;
  };
  wallpaper = ../../files/wallpaper.png;
  themeEnv = theme: pkgs.buildEnv {
    name = "${theme.name}-env";
    paths = [
      theme.package
      (pkgs.runCommand "wallpaper" {} ''
        mkdir -p $out/share/themes/${theme.name}/gnome-shell/assets
        ln -s ${wallpaper} $out/share/themes/${theme.name}/gnome-shell/assets/background.png
      '')
    ];
  };

  themeOption = mkOption {
    type = types.submodule {
      options = {
        name = mkOption {
          type = types.str;
        };
        package = mkOption {
          type = types.package;
        };
      };
    };
  };

  theming = config.theming;

in {

  options.theming = with types; {
    enable = mkOption {
      type = bool;
    };
    gtkTheme = themeOption;
    cursorTheme = themeOption;
    iconTheme = themeOption;
    qtTheme = themeOption;
    font = themeOption;
  };

  config = mkIf config.theming.enable {

    environment.variables = mkForce {
      QT_STYLE_OVERRIDE = "kvantum";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };

    home-manager.users.alexa = {

      qt.enable = true;
      qt.style = {
        name = "kvantum";
      };

      home.file.".face".source = ./../../files/obiwan.jpg;

      home.sessionVariables = buildVars theming.gtkTheme.name;
      systemd.user.sessionVariables = buildVars theming.gtkTheme.name;

      xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=${theming.qtTheme.name}
      '';

      gtk.enable = true;

      gtk.cursorTheme = theming.cursorTheme;

      gtk.iconTheme = theming.iconTheme;

      gtk.theme = theming.gtkTheme;

      xdg.configFile."gtk-4.0/gtk.css".source = "${themeEnv theming.gtkTheme}/share/themes/${theming.gtkTheme.name}/gtk-4.0/gtk.css";
      xdg.configFile."gtk-4.0/assets" = {
        source = "${themeEnv theming.gtkTheme}/share/themes/${theming.gtkTheme.name}/gtk-4.0/assets";
        recursive = true;
      };

      gtk.font = theming.font;

      home.packages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        theming.qtTheme.package
        qt5ct
      ];

      dconf.settings = {
        "org/gnome/shell/extensions/user-theme" = {
          name = theming.gtkTheme.name;
        };

        "org/gnome/desktop/background" = {
          picture-uri = "file:///home/alexa/.dotfiles/files/wallpaper.png";
          picture-uri-dark = "file:///home/alexa/.dotfiles/files/wallpaper.png";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
          titlebar-font = "MontSerrat Semi-Bold 11";
        };
      };
    };
  };
}
