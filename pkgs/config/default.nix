{ lib, pkgs }:

pkgs.runCommand "config" {
  preferLocalBuild = true;
  meta = with lib; {
    mainProgram = "config";
    description = "NixOS configuration manager";
    platforms = platforms.unix;
  };
} ''
  install -v -D -m755  ${./config} $out/bin/config

  substituteInPlace $out/bin/config \
    --subst-var-by bash "${pkgs.bash}" \
    --subst-var-by git "${pkgs.git}"

  install -D -m755 ${./completion.zsh} \
    $out/share/zsh/site-functions/_config
''
