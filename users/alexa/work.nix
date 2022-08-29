{ config, pkgs, ... }:{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    vscodium-fhs      
    dbeaver
    maven
    texlive.combined.scheme-full
    xournalpp
  ];
}
