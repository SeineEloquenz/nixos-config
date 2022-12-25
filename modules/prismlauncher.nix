{ config, lib, pkgs, ... }:

with lib;

{

  options.programs.prismlauncher = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable the Prismlauncher Minecraft Launcher";
    };
    jdks = mkOption {
      type = with types; listOf package;
      default = [ pkgs.jdk ];
      description = "Which jdks should be added to Prismlaunchers search path";
    };
  };

  config = mkIf config.programs.prismlauncher.enable {
    environment.systemPackages = [ (pkgs.prismlauncher-qt5.override { jdks = config.programs.prismlauncher.jdks; }) ];
  };
}
