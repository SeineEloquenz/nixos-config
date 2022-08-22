{ config, pkgs, ... }:{
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint
    hplipWithPlugin
    brlaser
    brgenml1lpr
    brgenml1cupswrapper
  ];
  hardware.sane.enable = true;
  users.users.alexa.extraGroups = [ "scanner" "lp" ];
  hardware.sane.extraBackends = with pkgs; [
    sane-airscan
  ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
}
