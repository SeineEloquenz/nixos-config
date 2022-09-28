{ config, pkgs, ... }:{

  # Data
  fileSystems."/run/media/alexa/Data" = {
      device = "/dev/disk/by-uuid/528553c6-ede8-465b-babc-11e86c842153";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."4a065941-84cb-44f4-a199-583222900537".device = "/dev/disk/by-uuid/4a065941-84cb-44f4-a199-583222900537";
}
