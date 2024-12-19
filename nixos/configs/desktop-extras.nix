{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    foldingathome
    gsconnect
    spacenavd
    via
    virtual-webcam
  ];
}
