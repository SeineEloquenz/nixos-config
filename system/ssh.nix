{ config, pkgs, ... }:{

  sops.secrets."ssh/id_ecdsa" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/id_ecdsa";
    sopsFile = ../.secrets/ssh.yaml;
  };

  sops.secrets."ssh/id_rsa" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/keys/id_rsa";
    sopsFile = ../.secrets/ssh.yaml;
  };

  sops.secrets."ssh/aur" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/keys/aur";
    sopsFile = ../.secrets/ssh.yaml;
  };

  sops.secrets."ssh/scc" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/keys/scc";
    sopsFile = ../.secrets/ssh.yaml;
  };

  sops.secrets."ssh/guests" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/keys/guests";
    sopsFile = ../.secrets/ssh.yaml;
  };

  sops.secrets."ssh/rack-0" = {
    owner = "alexa";
    path = "/home/alexa/.ssh/keys/rack-0";
    sopsFile = ../.secrets/ssh.yaml;
  };
}
