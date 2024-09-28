{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./file-systems.nix
    ./gdm/monitors
    ./home-manager
    ./users.nix
    configs.desktop
    configs.gaming
    configs.secureboot # Must be commented on first install
    hardware.asus-rog-strix-b550-i
  ];
}
