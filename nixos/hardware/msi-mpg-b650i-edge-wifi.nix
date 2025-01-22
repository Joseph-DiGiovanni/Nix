{ custom-modules, pkgs, ... }:

{
  imports = with custom-modules.nixos.hardware; [
    amd-cpu
    amd-graphics # For iGPU
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "nvme"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    kernelPackages = pkgs.linuxPackages_latest; # TODO: Possible fix for wake from sleep issues, can be removed at a later date
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
