{ pkgs, ... }:

{
  boot = {
    initrd.availableKernelModules = [ "i915" ];
    kernelPackages = pkgs.linuxPackages_latest; # TODO: Remove in next stable release
  };
}
