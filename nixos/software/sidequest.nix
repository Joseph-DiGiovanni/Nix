{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.sidequest ];
  networking.firewall = { allowedTCPPorts = [ 5555 ]; }; # Wireless adb
  programs.adb.enable = true;
}
