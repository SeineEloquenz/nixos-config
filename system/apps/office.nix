{ config, pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    xournalpp
    libreoffice
  ];
}
