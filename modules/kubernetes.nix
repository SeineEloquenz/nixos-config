{ config, pkgs, lib, ... }:

let cfg = config.programs.kubernetes;

  path = user: configName: "/home/${user}/.kube/configs/${configName}.yaml";

  createKubeconfig = user: configName: {
    name = "kubeconfig";
    value = {
      owner = user;
      path = path user configName;
      sopsFile = ./../secrets/kubeconfig/${configName}.yaml;
    };
  };

  buildKubeconfigVariable = configs: user: {
    KUBECONFIG = lib.fold (first: second: first + ":" + second) "" (map (path user) configs);
  };

  kubeConfigs = user: lib.listToAttrs (map (createKubeconfig user) config.programs.kubernetes.clusters);
in {

  options.programs.kubernetes = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
    user = mkOption {
      type = types.str;
    };
    enable-helm = mkOption {
      type = types.bool;
      default = false;
    };
    clusters = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };

  config = lib.mkIf cfg.enable {
    sops.secrets = kubeConfigs cfg.user;

    home-manager.users.${cfg.user}.programs = {
      bash.sessionVariables = buildKubeconfigVariable cfg.clusters cfg.user;
      zsh.sessionVariables = buildKubeconfigVariable cfg.clusters cfg.user;
      vscode.extensions = (if config.home-manager.users.${cfg.user}.programs.vscode.enable then [
        pkgs.vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
      ] else []);
    };

    environment.systemPackages = with pkgs; [
      kubectl
    ] ++ (if cfg.enable-helm then [ kubernetes-helm helmfile ] else []);
  };
}
