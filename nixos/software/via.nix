{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.via ];
  services.udev.packages = [ pkgs.via ];
}
