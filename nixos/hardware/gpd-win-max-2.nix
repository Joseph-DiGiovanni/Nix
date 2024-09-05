{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.hardware; [
    amd-cpu
    amd-graphics
  ];

  boot.initrd.availableKernelModules = [ "nvme" "sd_mod" "thunderbolt" "usb_storage" "usbhid" "xhci_pci" ];
}
