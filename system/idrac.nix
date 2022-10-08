{ config, pkgs, ...}:{
  services.idrac-6 = {
    enable = true;
    host = "192.168.178.61";
    port = "5900";
    user = "root";
    secret = {
      name = "idrac-6";
      owner = "alexa";
    };
  };
}
