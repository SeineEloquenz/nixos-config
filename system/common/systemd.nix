{ config, ... }:{
  systemd.services = {
    daily-vacuum = {
      description = "Daily journal vacuum";
      startAt = [ "*-*-* 16:00:00" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "journalctl --rotate --vacuum-time=21d";
      };
    };  
  };
}
