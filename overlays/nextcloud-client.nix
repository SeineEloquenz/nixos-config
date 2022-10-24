final: prev: {
  nextcloud-client = prev.nextcloud-client.overrideAttrs (old: {
    buildInputs = prev.lib.lists.subtractLists [ prev.plasma5Packages.kio prev.extra-cmake-modules ] old.buildInputs; 
  });
}
