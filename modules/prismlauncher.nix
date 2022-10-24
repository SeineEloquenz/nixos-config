{ config, lib, pkgs, ... }:

with lib;

{

  options.services.prismlauncher = {
    enable = mkOption {
      type = types.bool;
      description = "Whether to enable the Prismlauncher Minecraft Launcher";
    };
    jdks = mkOption {
      type = with types; listOf package;
      default = [ pkgs.jdk ];
      description = "Which jdks should be added to Prismlaunchers search path";
    };
  };

  config = mkIf config.services.prismlauncher.enable {
    environment.systemPackages = [ (pkgs.prismlauncher.override { jdks = config.services.prismlauncher.jdks; }) ];
  };
}
