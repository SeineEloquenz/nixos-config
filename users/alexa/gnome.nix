{ config, pkgs, ... }:

{
  imports =
    [
      ./gnome-theming.nix
    ];

  home.file.".face".source = ~/.dotfiles/files/obiwan.jpg;

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "x11gestures@joseexposito.github.io"
        "Vitals@CoreCoding.com"
        "gsconnect@andyholmes.github.io"
        "espresso@coadmunkee.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "ddterm@amezin.github.com"
      ];
    };
    "org/gnome/terminal/legacy" = {
      menu-accelerator-enabled = false;
      new-terminal-mode = "tab";
    };
    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = false;
      backspace-binding = "auto";
      delete-binding = "auto";  
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/alexa/.dotfiles/files/wallpaper.png";
      picture-uri-dark = "file:///home/alexa/.dotfiles/files/wallpaper.png";
    };
    "org/gnome/shell/tweaks" = { show-extensions-notice = false; };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };
  };
  
}
