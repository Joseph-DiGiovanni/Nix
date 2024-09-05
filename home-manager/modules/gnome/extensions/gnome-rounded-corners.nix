{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "Rounded_Corners@lennart-k" ];
  home.packages = with pkgs; [ gnomeExtensions.rounded-corners ];
}
