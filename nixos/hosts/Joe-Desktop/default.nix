{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./file-systems.nix
    ./gdm/monitors
    ./home-manager
    configs."3d-printing"
    configs.desktop
    configs.desktop-extras
    configs.gaming
    configs.monitor-control
    configs.secureboot # Must be commented on first install
    configs.vr
    hardware.amd-graphics
    hardware.msi-mpg-b650i-edge-wifi
    users.jdigi
  ];

  services = {
    displayManager.autoLogin.user = "jdigi";
    fprintd.enable = true;
  };
}
