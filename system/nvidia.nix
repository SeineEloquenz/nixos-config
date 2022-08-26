{ config, pkgs, ... }:{

  imports = [ ./nvidia-fix.nix ];
  disabledModules = [ "hardware/video/nvidia.nix" ];
  
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.nvidia = {
    nvidiaPersistenced = true;
  };

}
