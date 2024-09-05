{ custom-modules, ... }:

{
  imports = [ custom-modules.nixos.software.gnome-keyring-autologin-luks ];
  boot.initrd.systemd.enable = true; # Required for graphical password prompt
}
