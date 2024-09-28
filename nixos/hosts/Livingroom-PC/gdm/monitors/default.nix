{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    ''L+ /run/gdm/.config/monitors.xml - gdm gdm - ${pkgs.writeText "gdm_monitors.xml" (builtins.readFile ./monitors.xml)}''
  ];
}
