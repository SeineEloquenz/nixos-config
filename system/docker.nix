{ config, pkgs, ... }:{
  virtualisation.docker = {
    enable = true;
    enableNvidia = builtins.elem "nvidia" config.services.xserver.videoDrivers;
  };

  environment.systemPackages = [
    pkgs.docker-compose
  ];
  
  users.users.alexa = {
    extraGroups = [ "docker" ];
  };
}
