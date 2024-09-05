{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.hardware; [
    amd-cpu
    amd-graphics # For iGPU
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
