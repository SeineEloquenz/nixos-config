{ config, pkgs, ... }:{

  # SData
  fileSystems."/run/media/alexa/SData" = {
      device = "/dev/disk/by-uuid/8201af2a-2a48-4ea3-b637-cf3223f284dd";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-cb69389d-8118-4c2a-af8a-6d92848d6bad".device = "/dev/disk/by-uuid/cb69389d-8118-4c2a-af8a-6d92848d6bad";

  # IData
  fileSystems."/run/media/alexa/IData" = {
      device = "/dev/disk/by-uuid/bc36ed71-c04b-4611-8436-490fdae64af6";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-08a66126-62ed-4ffe-a8dd-ad7a9c61f29b".device = "/dev/disk/by-uuid/08a66126-62ed-4ffe-a8dd-ad7a9c61f29b";

  # Data
  fileSystems."/run/media/alexa/Data" = {
      device = "/dev/disk/by-uuid/29aea319-492f-4a78-99e0-85d2147cb727";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-ca7d7ccb-63ed-4c53-861c-1742536059cc".device = "/dev/disk/by-uuid/ca7d7ccb-63ed-4c53-861c-1742536059cc";
}
