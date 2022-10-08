{ lib
, stdenv
, makeWrapper
, makeDesktopItem
, steam-run
, iDRAC
}:

let
  desktopFile = makeDesktopItem {
    name = "iDRAC";
    exec = "iDRAC";
    comment = "Virtual Console for iDRAC based dell management controllers";
    desktopName = "iDRAC Virtual Console";
    categories = [ "System" ];
  };

  jre = stdenv.mkDerivation {
    name = "idrac-jre";
    src = builtins.fetchTarball {
      url = "https://download.java.net/openjdk/jdk7u75/ri/openjdk-7u75-b13-linux-x64-18_dec_2014.tar.gz";
      sha256 = "1vlj04z7glpgqdbkwla92xxbjdbqb805jxb4gvz1z1vwpma8hh5i";
    };
    installPhase = ''
      cp -r $src $out
    '';
  };

in stdenv.mkDerivation rec {
  name = "iDRAC-6";
  version = "1.0";

  src = ./src;

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''
    mkdir -pv $out/share/java $out/bin $out/lib
    cp ${src}/avctKVM.jar $out/share/java/avctKVM.jar
    cp ${src}/java.security $out/share/java/java.security
    cp -r ${src}/lib $out

    makeWrapper ${steam-run}/bin/steam-run $out/bin/iDRAC \
      --add-flags "${jre}/bin/java -cp $out/share/java/avctKVM.jar com.avocent.idrac.kvm.Main -Djava.security.debug=properties -Djava.library.path=$out/lib -Djava.security.properties==$out/share/java/java.security ip=${iDRAC.host} kmport=${iDRAC.port} vport=${iDRAC.port} user=${iDRAC.user} passwd=\"$(cat ~/.config/idrac-6/pw)\" apcp=1 version=2 vmprivilege=true \"helpurl=https://${iDRAC.host}:443/help/contents.html\""
    mkdir -pv $out/share/applications
    cp ${desktopFile}/share/applications/* $out/share/applications/iDRAC.desktop
  '';

  meta = with lib; {
    description = "iDRAC management tool for Dell servers";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
