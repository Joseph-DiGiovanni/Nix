{ config, lib, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  security.polkit.enable = lib.mkForce true;
}
