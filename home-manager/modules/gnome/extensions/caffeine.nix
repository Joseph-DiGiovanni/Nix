{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "caffeine@patapon.info" ];
  home.packages = with pkgs; [ gnomeExtensions.caffeine ];
}
