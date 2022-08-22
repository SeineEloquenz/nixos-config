{ config, pkgs, ... }:{
  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelModules = [ "coretemp" ];

  services.thermald.enable = true;
}
