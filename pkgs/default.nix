self: super:

{
  configurationhelper = super.callPackage ./config {};
  orchis-gtk = super.callPackage ./orchis-gtk { tweaks = [ "solid" "compact" "primary" "macos" "submenu" ]; };
  orchis-kde = super.callPackage ./orchis-kde {};
}
