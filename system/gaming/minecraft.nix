{ pkgs, ... }:{
  programs.prismlauncher = {
    enable = true;
    jdks = [ pkgs.jdk ];
  };
}
