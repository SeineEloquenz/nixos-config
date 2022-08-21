{ config, pkgs, ... }:{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    vscodium-fhs      
    maven
  ];
}
