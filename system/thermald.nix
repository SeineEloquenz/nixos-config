{ ... }:{
  boot.kernelModules = [ "coretemp" ];

  services.thermald.enable = true;
}
