{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "bottom-overview@fthx" ];
  home.packages = with pkgs; [ gnomeExtensions.bottom-overview ];
}
