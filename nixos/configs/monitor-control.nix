{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    hardware.ddc-cl
    software.gnome-brightness-control
  ];
}
