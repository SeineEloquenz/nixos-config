{ lib
, pkgs
, stdenv
}:

stdenv.mkDerivation rec {
    pname = "steam-adwaita";
    version = "0.17";
    src = pkgs.fetchFromGitHub {
      owner = "tkashkin";
      repo = "Adwaita-for-Steam";
      rev = "v${version}";
      sha256 = "0grzyjhiqad2qpz8d6wlsf7a0ars7pay8ya0162i4ln3zsnwsmfz";
    } + "/Adwaita";

    installPhase = ''
      cp -r ${src} $out
    '';
  }
