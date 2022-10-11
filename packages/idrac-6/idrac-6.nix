{ lib
, pkgs
, stdenv
, makeDesktopItem
, buildFHSUserEnv
, iDRAC
, runCommand
, libX11, libXext, libXi, libXt, libXtst, libXrender, freetype, fontconfig
}:

let
  jre = stdenv.mkDerivation {
    name = "idrac-6-jre";
    src = builtins.fetchTarball {
      url = "https://cdn.azul.com/zulu/bin/zulu7.56.0.11-ca-jdk7.0.352-linux_x64.tar.gz";
      sha256 = "15xb1ahnqjmmi7688rspd8aqsqh9qcyfjqdj4yi2q2n9yk920rq3";
    };
    installPhase = ''
      cp -r $src $out
    '';
  };
 
  desktopItem = makeDesktopItem {
    name = "iDRAC";
    exec = "iDRAC";
    comment = "Virtual Console for iDRAC based dell management controllers";
    desktopName = "iDRAC Virtual Console";
    categories = [ "System" ];
    icon = ./src/share/icons/dell-logo.png;
  };

  idrac-env = buildFHSUserEnv {
    name = "idrac-6-env";
    multiPkgs = pkgs: [
      jre
      libX11
      libXext
      libXi
      libXt
      libXtst
      libXrender
      freetype
      fontconfig
    ];
  };

  idrac = stdenv.mkDerivation rec {
    name = "idrac-6";
    src = ./src;

    installPhase = ''
      mkdir -pv $out/share $out/bin $out/lib
      cp -r ${src}/lib $out
      cp -r ${src}/share $out

      cat <<EOT >> $out/lib/iDRAC
      java -cp $out/share/java/avctKVM.jar com.avocent.idrac.kvm.Main -Djava.security.debug=properties -Djava.library.path=$out/lib -Djava.security.properties==$out/share/java/java.security ip=${iDRAC.host} kmport=${iDRAC.port} vport=${iDRAC.port} user=${iDRAC.user} passwd="\$(< ~/.config/idrac-6/pw)" apcp=1 version=2 vmprivilege=true "helpurl=https://${iDRAC.host}:443/help/contents.html"
      EOT

      chmod +x $out/lib/iDRAC

      cat <<EOT >> $out/bin/start.sh
      #!${pkgs.bash}/bin/bash
      $out/lib/iDRAC
      EOT
      chmod +x $out/bin/start.sh
    '';
  };

in runCommand "iDRAC"
  {
    startScript = ''
      #!${pkgs.bash}/bin/bash
      ${idrac-env}/bin/idrac-6-env ${idrac}/bin/start.sh "$@"
    '';
  }
  ''
    mkdir -p $out/{bin,share}
    echo -n "$startScript" > $out/bin/iDRAC
    chmod +x $out/bin/iDRAC
    ln -s ${desktopItem}/share/applications $out/share/applications
  ''
