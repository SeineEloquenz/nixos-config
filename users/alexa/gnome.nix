{ config, pkgs, ... }:

{
  imports =
    [
      ./gnome-theming.nix
    ];

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
    "org/gnome/shell/tweaks" = { show-extensions-notice = false; };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };
  };
  
}
