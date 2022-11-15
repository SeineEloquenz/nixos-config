{ config, lib, pkgs, ... }:

with lib;

let

  steam-adwaita = (pkgs.callPackage ./steam-adwaita.nix {});

in {

  options.programs.steam.adwaita-theme = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable steam adwaita theme";
    };
  };

  config = mkIf (config.programs.steam.enable && config.programs.steam.adwaita-theme.enable) {

    home-manager.users.alexa = {
      home.file.".steam/steam/skins/Adwaita".source = steam-adwaita;
    };

    environment.systemPackages = [
      steam-adwaita
    ];
  };
}
