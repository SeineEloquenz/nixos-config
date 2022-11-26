{ config, pkgs, ... }:

let

  texlive-juso-template.pkgs = [ pkgs.juso-motion-template ];

  mytexlive = with pkgs; (texlive.combine {
    inherit (texlive) scheme-full;
    inherit texlive-juso-template;
  });

in {

  imports = [
    ./vscode.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.webstorm
    jetbrains.idea-ultimate
    dbeaver
    mytexlive
    nix-prefetch-git
  ];
}
