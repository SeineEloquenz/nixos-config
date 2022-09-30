{ config, pkgs, ... }:{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName  = "Alexander Linder";
    userEmail = "alexander.linder@mondcarion.group";

    delta.enable = true;
  };
}
