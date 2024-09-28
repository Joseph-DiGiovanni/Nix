{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "hidetopbar@mathieu.bidon.ca" ];
  home.packages = with pkgs; [ gnomeExtensions.hide-top-bar ];
}
