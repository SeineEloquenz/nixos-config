{ config, pkgs, ... }:{

  imports =
    [ # Include zsh config
      ./zsh.nix
      ./ssh.nix
      ./git.nix
    ];

  home.username = "alexa";
  home.homeDirectory = "/home/alexa";

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neofetch
    nextcloud-client
    polymc
    gimp
    inkscape
    sublime-music
    schildichat-desktop
    fragments
    libreoffice
    AusweisApp2
    tor-browser-bundle-bin
  ];
}
