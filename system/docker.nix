{ pkgs, ... }:{
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  environment.systemPackages = [
    pkgs.docker-compose
  ];
  
  users.users.alexa = {
    extraGroups = [ "docker" ];
  };
}
