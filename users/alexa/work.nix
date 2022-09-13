{ config, pkgs, ... }:{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    vscodium-fhs
    dbeaver
    texlive.combined.scheme-full
    xournalpp
    # Nix stuff
    nix-prefetch-git
  ];
}
