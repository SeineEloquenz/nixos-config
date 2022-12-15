{ config, pkgs, ... }:{

  # SData
  fileSystems."/run/media/alexa/SData" = {
      device = "/dev/disk/by-uuid/8201af2a-2a48-4ea3-b637-cf3223f284dd";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-cb69389d-8118-4c2a-af8a-6d92848d6bad".device = "/dev/disk/by-uuid/cb69389d-8118-4c2a-af8a-6d92848d6bad";

  # Data
  fileSystems."/run/media/alexa/Data" = {
      device = "/dev/disk/by-uuid/29aea319-492f-4a78-99e0-85d2147cb727";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-1ed6e501-d8f1-4fe6-919b-6fabad7a646e".device = "/dev/disk/by-uuid/1ed6e501-d8f1-4fe6-919b-6fabad7a646e";
}
