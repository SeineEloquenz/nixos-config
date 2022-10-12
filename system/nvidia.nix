{ config, pkgs, ... }:{

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaPersistenced = true;
  };
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

}
