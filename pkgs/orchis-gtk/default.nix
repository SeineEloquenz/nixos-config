{ lib
, stdenvNoCC
, fetchFromGitHub
, gtk3
, gnome-themes-extra
, gtk-engine-murrine
, sassc
, border-radius ? null # Suggested: 2 < value < 16
, tweaks ? [ ] # can be "solid" "compact" "black" "primary" "macos" "submenu"
, withWallpapers ? false
}:

let
  validTweaks = [ "solid" "compact" "black" "primary" "macos" "submenu" ];
  unknownTweaks = lib.subtractLists validTweaks tweaks;
in
assert lib.assertMsg (unknownTweaks == [ ]) ''
  You entered wrong tweaks: ${toString unknownTweaks}
  Valid tweaks are: ${toString validTweaks}
'';

stdenvNoCC.mkDerivation rec {
  pname = "orchis-theme";
  version = "55812fc52fe2c78bedeb523a0f26c42f138e2534";

  src = fetchFromGitHub {
    repo = "Orchis-theme";
    owner = "SeineEloquenz";
    rev = version;
    sha256 = "11g6xk83skifb4wp633znmm03fmljln9g1nmghycbvqqw5k07iq9";
  };

  nativeBuildInputs = [ gtk3 sassc ];

  buildInputs = [ gnome-themes-extra ];

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  preInstall = ''
    mkdir -p $out/share/themes
  '';

  installPhase = ''
    runHook preInstall
    bash install.sh -d $out/share/themes -t all \
      ${lib.optionalString (tweaks != []) "--tweaks " + builtins.toString tweaks} \
      ${lib.optionalString (!isNull border-radius) ("--round " + builtins.toString border-radius + "px")}
    ${lib.optionalString withWallpapers ''
      mkdir -p $out/share/backgrounds
      cp src/wallpaper/{1080p,2k,4k}.jpg $out/share/backgrounds
    ''}
    runHook postInstall
  '';

  meta = with lib; {
    description = "A Material Design theme for GNOME/GTK based desktop environments.";
    homepage = "https://github.com/vinceliuice/Orchis-theme";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
