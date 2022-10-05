{ config, lib, ... }:{
  home-manager.users.alexa = {
    dconf.settings = {
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
    };
  };
}
