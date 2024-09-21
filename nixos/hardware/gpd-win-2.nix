{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.hardware; [
    intel-cpu
    intel-graphics
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
    kernelParams = [ "video=eDP-1:panel_orientation=right_side_up" ];
  };
}
