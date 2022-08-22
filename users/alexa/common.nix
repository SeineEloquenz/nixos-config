{ config, pkgs, ... }:{

  imports =
    [ # Include zsh config
      ./zsh.nix
      ./git.nix
    ];

  home.username = "alexa";
  home.homeDirectory = "/home/alexa";

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
  };

  home.packages = with pkgs; [
    neofetch
    nextcloud-client
    polymc
    gimp
    inkscape
    vlc
    sublime-music
    schildichat-desktop
    fragments
    libreoffice
    AusweisApp2
  ];
}
