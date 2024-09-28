{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "no-titlebar-when-maximized@alec.ninja" ];
  home.packages = with pkgs; [ gnomeExtensions.no-titlebar-when-maximized ];
}
