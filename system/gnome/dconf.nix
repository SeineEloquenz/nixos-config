{ config, pkgs, ... }:

{

  home-manager.users.alexa = {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "Vitals@CoreCoding.com"
          "gsconnect@andyholmes.github.io"
          "espresso@coadmunkee.github.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "ddterm@amezin.github.com"
        ];
      };

      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Layan-dark";
      };

      "com/github/amezin/ddterm" = {
        window-monitor = "primary";
        window-size = 1.0;

        # Hotkeys
        ddterm-toggle-hotkey = [ "<Super>Return" ];
        shortcut-next-tab = [ "<Shift>Right" ];
        shortcut-prev-tab = [ "<Shift>Left" ];
        shortcut-move-tab-next = [ "<Primary><Shift>Right" ];
        shortcut-move-tab-prev = [ "<Primary><Shift>Left" ];
        shortcut-win-new-tab = [ "<Primary><Shift>t" ];
        shortcut-window-size-dec = [ "" ];
        shortcut-window-size-inc = [ "" ];
      };

      "org/gnome/terminal/legacy" = {
        menu-accelerator-enabled = false;
        new-terminal-mode = "tab";
      };

      "org/gnome/terminal/legacy/keybindings" = {
        move-tab-left = "<Primary><Shift>Left";
        move-tab-right = "<Primary><Shift>Right";
        next-tab = "<Shift>Right";
        prev-tab = "<Shift>Left";
      };

      "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        audible-bell = false;
        backspace-binding = "auto";
        delete-binding = "auto";  
        font = "RobotoMono Nerd Font Mono 10";
      };

      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/alexa/.dotfiles/files/wallpaper.png";
        picture-uri-dark = "file:///home/alexa/.dotfiles/files/wallpaper.png";
      };

      "org/gnome/desktop/interface" = {
        font-antialiasing = "grayscale";
        font-hinting = "full";
        document-font-name = "Montserrat Semi-Bold 10";
        monospace-font-name = "RobotoMono Nerd Font Medium 10";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        titlebar-font = "MontSerrat Semi-Bold 11";
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        panel-run-dialog = [ "<Super>d" ];
      };

      "org/gnome/shell/tweaks" = { show-extensions-notice = false; };

      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        two-finger-scrolling-enabled = true;
      };

      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
      };

      "org/gnome/GWeather4" = {
        temperature-unit = "centigrade";
      };
    };
  };
  
}
