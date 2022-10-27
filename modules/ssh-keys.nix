{ config, lib, pkgs, ... }:

with lib;

let
  sshKey = types.submodule ({config, ... }: {
    options = {
      owner = mkOption {
        type = types.str;
        default = "alexa";
        description = ''
          User owning this key
        '';
      };
      dir = mkOption {
        type = types.str;
        default = "";
        description = ''
          Directory under which the key should be put
        '';
      };
      pub = mkOption {
        type = types.str;
        description = ''
          Associated public key
        '';
      };
    };
  });

  dirPath = dir: if stringLength dir > 0 then dir + "/" else dir;

  createPrivateKey = name: key: {
    name = "ssh/${name}";
    value = {
      owner = "${key.owner}";
      path = "/home/${key.owner}/.ssh/${dirPath key.dir}${name}";
      sopsFile = ./../secrets/ssh.yaml;
    };
  };

  createPublicKey = name: key: {
    name = key.owner;
    value = {
      home.file.".ssh/${dirPath key.dir}${name}.pub".text = key.pub;
    };
  };

  privateKeys = mapAttrs' createPrivateKey config.ssh.keys;
  publicKeys = (key: {${key.name} = key.value;}) (foldl recursiveUpdate {} (mapAttrsToList createPublicKey config.ssh.keys));

in {

  options.ssh = {
    keys = mkOption {
      type = types.attrsOf sshKey;
      default = {};
    };
  };

  config = {
    sops.secrets = privateKeys;
    home-manager.users = publicKeys;
  };
}
