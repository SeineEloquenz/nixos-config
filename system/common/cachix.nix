{ config, pkgs, ... }:{

  environment.systemPackages = [
    pkgs.cachix
  ];

  sops.secrets.cachix_auth_token = {
    owner = "alexa";
    path = "/home/alexa/.config/cachix/cachix.dhall";
    sopsFile = ./../../.secrets/secrets.yaml;
  };

  nix = {
    settings.substituters = [
      "https://mcg-cache.cachix.org/"
    ];
    settings.trusted-public-keys = [
      "mcg-cache.cachix.org-1:VjFN0xFIgM5EXKMbglSW8TzOSCFMnG+L+2uKuglqg9o="
    ];
  };
}
