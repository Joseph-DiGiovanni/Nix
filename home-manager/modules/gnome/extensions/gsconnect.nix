{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "gsconnect@andyholmes.github.io" ];
  home.packages = with pkgs; [ gnomeExtensions.gsconnect ];
}
