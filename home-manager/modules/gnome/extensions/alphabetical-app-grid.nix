{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "AlphabeticalAppGrid@stuarthayhurst" ];
  home.packages = with pkgs; [ gnomeExtensions.alphabetical-app-grid ];
}
