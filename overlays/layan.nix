final: prev: {
  layan-gtk-theme = prev.layan-gtk-theme.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "layan-gtk-theme";
      rev = "4875fec289eb02b7ed508f44774e496b2ab91d89";
      sha256 = "0mwr80wwcv79sxvs07q7p6mvpz6klw25n74q75fc5dmdj3pid50a";
    };
  });
  layan-kde = prev.layan-kde.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "layan-kde";
      rev = "1e986673e3b5dd0c290fc6b4afd51803a2b9f98b";
      sha256 = "0qgzxz18wfp56m4v18r7nwrhyjn69l5d0i1ksyl6i4awy05bfj8p";
    };
  });
}
