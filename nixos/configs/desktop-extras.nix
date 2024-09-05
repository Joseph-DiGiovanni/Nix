{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    gsconnect
    via
    virtual-webcam
  ];
}
