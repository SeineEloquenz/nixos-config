{ config, pkgs, ... }:{

  # SData
  fileSystems."/run/media/alexa/SData" = {
      device = "/dev/disk/by-uuid/8201af2a-2a48-4ea3-b637-cf3223f284dd";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-cb69389d-8118-4c2a-af8a-6d92848d6bad" = {
    device = "/dev/disk/by-uuid/cb69389d-8118-4c2a-af8a-6d92848d6bad";
    bypassWorkqueues = true;
  };

  # IData
  fileSystems."/run/media/alexa/IData" = {
      device = "/dev/disk/by-uuid/e217e126-0eff-476f-a6e5-7ff0189d034d";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-106a5e3c-09e7-4b76-9fb8-fc1d6bc04e35" = {
    device = "/dev/disk/by-uuid/106a5e3c-09e7-4b76-9fb8-fc1d6bc04e35";
    bypassWorkqueues = true;
  };

  # Data
  fileSystems."/run/media/alexa/Data" = {
      device = "/dev/disk/by-uuid/29aea319-492f-4a78-99e0-85d2147cb727";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-1ed6e501-d8f1-4fe6-919b-6fabad7a646e" = {
    device = "/dev/disk/by-uuid/1ed6e501-d8f1-4fe6-919b-6fabad7a646e";
  };
}
