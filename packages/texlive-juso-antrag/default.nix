{ pkgs, ...}:

pkgs.stdenv.mkDerivation rec {
  version = "v1.0.0";
  pname = "texlive-juso-antrag-template";
  tlType = "run";

  src = pkgs.fetchFromGitHub {
    owner = "SeineEloquenz";
    repo = "juso-antrag-template";
    rev = "99675d9beb585097fc19e914ef0d4fccffe43ffc";
    sha256 = "1qx48x3qwijfqls7cn394ig4w394v7b9a7lzbahfd6yabsnafk4l";
  };

  dontBuild = true;

  installPhase = "
    mkdir -p $out/tex/latex
    cp -va src/*.cls src/*.png $out/tex/latex
  ";
}
