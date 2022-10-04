{ config, pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    dbeaver
    vscodium
    texlive.combined.scheme-full
    nix-prefetch-git
  ];

  home-manager.users.alexa = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        redhat.vscode-yaml
      ];
    };
  };
}
