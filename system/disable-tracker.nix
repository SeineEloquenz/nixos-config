{ config, pkgs, ... }:{

  # Disable indexing
  services.gnome.tracker-miners.enable = false;
  services.gnome.tracker.enable = false;

  # Disable packages not working correctly without tracker
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome.totem
  ]);
}
