{ pkgs, ... }:{
  hardware.firmware = with pkgs; [
    (callPackage ./qca6174_firmware.nix {})
  ];
}
