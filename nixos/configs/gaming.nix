{ custom-modules, pkgs, ... }:

{
  imports = with custom-modules.nixos.software; [ steam ];

  boot.kernelModules = [ "hid_steam" ];

  services.udev = {
    enable = true;

    extraRules = ''
      # Valve USB devices
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666", TAG+="uaccess"

      # Steam Controller udev write access
      KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput"

      # Valve HID devices over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666", TAG+="uaccess"

      # Valve HID devices over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666", TAG+="uaccess"
    '';

    packages = with pkgs; [
      game-devices-udev-rules
    ];
  };
}
