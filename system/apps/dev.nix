{ config, pkgs, ... }:

let

  texlive-juso-template.pkgs = [ pkgs.texlive-juso-template ];

  mytexlive = with pkgs; (texlive.combine {
    inherit (texlive) scheme-full;
    inherit texlive-juso-template;
  });

in {
  environment.systemPackages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    dbeaver
    vscodium
    mytexlive
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
