{ config, pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.alexa.extraGroups = [ "adbUsers" ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
