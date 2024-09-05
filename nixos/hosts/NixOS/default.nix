{ inputs, lib, modulesPath, pkgs, ... }:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-gnome.nix")
    (modulesPath + "/installer/cd-dvd/channel.nix")
    inputs.home-manager.nixosModules.home-manager
  ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  home-manager.users.nixos = { }; # Required to apply home manager config
}
