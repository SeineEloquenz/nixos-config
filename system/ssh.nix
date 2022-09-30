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

  home-manager.users.alexa = {
    home.file.".ssh/id_ecdsa.pub".text = "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAG2dlvxsK8sFLZaqupo3mqEU2llLMkep87cwW9Zu77lBRdPI7X/UOWV5rFToOD/gprWeNNM2Y/a4GCI1jc1X3QYhgHwkf+3odCYYy+0YT/pxjwl3XTKb05bJlOaK07j3j/XZoDMEgfgb+Ma7gQJOqL9qBA9mg6kYNOXSTkz4Wq2KgOjcQ== alexa@mcg-pres";
    home.file.".ssh/keys/id_rsa.pub".text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6fDeJXb0a+UFwlOeF6hY8Y5vAGSTTBVQ/2akB2ViXQaVascGR6Hl9bKMKiQ6+Qbg8kGNDJ4iEDalN1Q/E2T23QHnrbOuoLf+xF5l3Zd5wyhBIsNj2n3jr+SL66uyJcgJuFGE7y1cHN1fEh//HUb5RmoYdW9+utaaXUdvSw6xoRnpc3hmOPvLc8/fpO9utIj0TbVKL+VyM+dKiuGF0O0huGftUAZht6Zy1rdijCbEkslf6jCap/HNBPjbna/K6lfFOBgeCBhYAvQoUvx94k8qiyBIOKJaqGiKSOzFpm6hhOdD4I7yWNTDKsspF7jek5S8bWMGFftMQlO1n5J+WODaUgTQx4OKfLVnaiB7BXVt4lo0WaI+mXnjQvqxjifaQB1MP0LmE+ttLZ4ftFY/FCqzA1NMFoa5bXsxjkGkdHem8Vt38qU6V47iPBEoZJkIu6c/54irnngMaucnu5JcxXLST520pbIwi0KlmW3NvRtEB63nk6e3GcZGHcZXHG3hVzV0= alexa@mcg-pres";
    home.file.".ssh/keys/aur.pub".text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP5Ma4JyoTTdvhOEpPtWO56hfTrPoDg/5RyT5gJgduSANygQCkhNfUocnvsdoYLRz1rM0zRFXAzgYWSOKt4xVnUGutCwapDZT1r5R6Y8FC+MTWdW3QnDadIvfngGoKVVrb0otGU7CLGFr+14pgyhMqoTPRtiXE7m/MH4sRsm7CpkP+B9XWd6MrYxJN/LlFh304q5/ExpWIl3XkqsjirIqJ66YZZD6BwO/Eai8Nk9bjVD6VjfuIB0oM5N4kowiKS1pq3WQb8SRPOOBbgQ47Si4fZTPYgZ4hJDLHouP5Ql7B5bjqVzLaBxihcZr3XFl3sy3ojgX6nKwvJjozpE0gisYbwjHiTXpYwVJCcwiPFFmgGuhnJfR2zCbWrVJrwi+1QdO7byWDX1RaIqZjS52KBE1KJWafev4oP7/V1JYzMN+kAWBR3WnLViEOdVDLDhYk6xIEGIkhvuPNw6yL5gDwG5iaex1/7lo8Nw2v36JrrD9zqtdK8jILnQ4l3eHpaBQ7LTk= alexa@mcg-pres";
    home.file.".ssh/keys/scc.pub".text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyqssBq785IG2rtvOBQFLXOidPiskEZ6036rZCKKF65TeLkTg3DX8L4y6M5z3Sl3xq0flzxJ1DFm6xxg4D2PCDvL/KNx802DGJUkmA8Gc+4pDHMX2qARhhrgI0VsnxfWnMVFtHtTWlYE43xb+M+p6B8yNTyjIEv7Mh7qOSCzPv3p/f2AzEvmlyGJ1wfw9/c96IDhTz9n692ptHY1xah7i7VrpyJk4QSOHIvkFBvrNlwT5u7ErQLDrfWf+9IGGUcsgFEd+zTt3QBCCJuxSMaQskfC4juACSlK0iJUoAko87SdlSptxdkmbg/Zii7C+xwWlLO1AYVaSrUq+HkbgGpd9Zh6+nR4pgsbAJesQ1S8CZs+AAkmD6fFu/SrSI2SpKVstxw44wZVZXOx5V/CyYyvoXiB3cv8RfsYHbqAbo312AsyCaP46ZRbNyeyqg+m2drnHe2M7VUN5a3bXjhO3a3U3ZKpz+2t5ACO4snnAjdeBdZ3NjTsH5peTMTcQhooLfkvE= alexa@mcg-pres";
    home.file.".ssh/keys/guests.pub".text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzloMPPwrWcLT3XyC65U5lSFNDJBsPQmukb67FgJjvCo+NXuuLfZ5tQd3EMiSTTFFvWkZ+awI+9+uDBhUyRy91aglmmDycZ1DzMVwPzDGO8QGg7d0NvK1mZaeFRjyvNOGy4L9xbsl9L2FLiGHIP0ddazxqp2xjzMYqOO2n8vPVicGWrftfLV5IAg3bnC9xMxAhiBjX1MUHcPy9qZAuLz3aAPBskWXLU3A7wsVMZAAHAGuqS8MgVxPcIDyvFoelBSkLX4vY2W0taU6SZxcbBlxNlq2fCz5MFDYsmtlXs5JE7q3FQ1ssAikSe1mB+trTnUuWVT1rOpUQch6ncGHG9ccyKoXmZEijYQ3xMuGtjeZ2N6V3JeqMHJ/r9045zE8qf5YDh5ptAYtSJP/FwTRH4+rFG3wWnMmV5VojRt+kxaNlhpIfkdU63rlmCWU46KXVitrPNTKkd50OtkRySvcTqXsT1eTlu0PQePet869hNDlKI+gDCdA1DNNxBVygk3OkQHPhDU+vxCH+b3PTamicS6jX+sdAWM8pKwTCHCLq0FVYXw6tikTHSuQLMrdjHeE6hHE949emATsFyMMsWemfUGNCaodhkQxTt+l/LckcVWyn6OKqwFD6FtDr9XdI0LoJf7BVG+RkUsNoPBRZFc5FvaQ4Sj7IVURaimosV2fkeB60LQ== alexa@mcg-pres";
    home.file.".ssh/keys/rack-0.pub".text = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvga1I9G81AXIso8F9zConBERALowLdcUQrR12c7gJCcZDfVixQK+lV07EgLbrv2NBF2jZSiFPDyOZi+mMSE+nTkg/Ifpus+1abmrzbxoFcCR2gQm8799CVlcbjEdqLD9i+oFkARIcZZSW2OI6TjH5Y3FeCh6EipchOIM88Yy6M8rCIHpeC6AkqCGBo1mrv1PWKg3gp9FlaoM3M9hq/qbnAQOz2Esoa9JBzVTBMxjPs9A4DgbCl+Ez6FdcwMqjgFjd0Sl3veS7IeOwsp/D8qWXH/eCzBUldbeXBJYVJ7ulKLsbC41LEV98uOrRkO7wd8XN2kSu+SBheqV+b9Ccx9suQohb2OB/DIr+/5WDHgHq9kLLgkMje0KCiqwhY3YwbDX0MAqerVpflOf5Ox/B9UUo3baEicqhtrOr+bAKKhGYlgB0KfOqsOVHIZhrR+4w6U0PIjCS5k1gHdvlNveBdETQyf8cW1i2S1NNsydh9G4adhdwWtP9kEAKzWNkbngikVxPATqf9q8urxiVCyIuNJFpmjbWk+dPQBdSDG4zXlD2K/c7VFSlJNmAcc3g8ZXxqbrKe1z7hXSoSohBX12f4faFvkTCDLQfUAdf6mRehtl4vJapVZH2PTcWy/5kY3oFIlvCFERcJGXdNjG+/2CdXyhs1eb44a3TQorZg1v7wCW6Tw== alexa@mcg-pres";

    programs.ssh = {

      enable = true;
    
      extraConfig = ''
        AddKeysToAgent yes
      '';

      matchBlocks = {
        "aur.archlinux.org" = {
          user = "aur";
          identityFile = "~/.ssh/keys/aur";
        };

        "git.scc.kit.edu" = {
          identityFile = "~/.ssh/keys/scc";
         };

         "github.com" = {
           user = "git";
           identityFile = "~/.ssh/keys/id_rsa";
         };

        "gaymops.mondcarion.group" = {
          identityFile = "~/.ssh/id_ecdsa";
        };

        "mail.mondcarion.group" = {
          identityFile = "~/.ssh/id_ecdsa";
        };

        "genie.internal.mondcarion.group" = {
          user = "pi";
          identityFile = "~/.ssh/id_ecdsa";
        };

        "rack-0.pve.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/rack-0";
        };

        "gate.internal.mondcarion.group" = {
          identityFile = "~/.ssh/keys/guests";
        };

        "docker.internal.mondcarion.group" = {
          identityFile = "~/.ssh/keys/guests";
        };

        "dns.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };

        "postgres.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };

        "cloud.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/geusts";
        };

        "fancontrol-0.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/geusts";
        };

        "navidrome.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };

        "mumble.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };

        "matrix.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };

        "tts.internal.mondcarion.group" = {
          user = "root";
          identityFile = "~/.ssh/keys/guests";
        };
      };
    };
  };
}
