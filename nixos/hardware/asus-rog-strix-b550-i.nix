{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.hardware; [
    amd-cpu
    amd-graphics # For iGPU
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
}
