{ stdenv
, lib
, fetchFromGitHub
, gitUpdater
}:

stdenv.mkDerivation rec {
  pname = "orchis-kde";
  version = "5838ba2abaea02211198dcd3fbd011b2f175f97f";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = pname;
    rev = version;
    sha256 = "1lwz0wzgv9yybcw5w4pag3xps37iqh4x9d52fl2b59y1936h3f71";
  };

  patches = [
    ./0001-Make-theme-opaque.patch
  ];

  postPatch = ''
    patchShebangs install.sh
    substituteInPlace install.sh \
      --replace '$HOME/.local' $out \
      --replace '$HOME/.config' $out/share
  '';

  installPhase = ''
    runHook preInstall
    name= ./install.sh --dest $out/share/themes
    mkdir -p $out/share/sddm/themes
    cp -a sddm/Orchis* $out/share/sddm/themes/
    runHook postInstall
  '';

  passthru.updateScript = gitUpdater { };

  meta = with lib; {
    description = "A flat Design theme for KDE Plasma desktop";
    homepage = "https://github.com/vinceliuice/Orchis-kde";
    license = licenses.gpl3Only;
    platforms = platforms.all;
  };
}
