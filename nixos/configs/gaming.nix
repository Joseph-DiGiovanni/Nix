{ custom-modules, pkgs, ... }:

{
  imports = with custom-modules.nixos.software; [ steam ];

  services.udev = {
    enable = true;
    packages = with pkgs; [
      game-devices-udev-rules
    ];
  };
}
