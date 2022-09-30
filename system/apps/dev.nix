{ config, pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    vscodium-fhs
    dbeaver
    texlive.combined.scheme-full
    nix-prefetch-git
  ];
}
