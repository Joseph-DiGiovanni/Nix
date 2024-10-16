{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    foldingathome
    gsconnect
    via
    virtual-webcam
  ];
}
