{ config, lib, ... }:{
  home-manager.users.alexa = {
    programs.rbw = {
      enable = true;
      settings = {
        base_url = "https://pass.mondcarion.group";
        email = "alexander.linder@mondcarion.group";
        pinentry = lib.mkIf config.services.xserver.desktopManager.gnome.enable "gnome3";
        lock_timeout = 300;
      };
    };
  };
}
