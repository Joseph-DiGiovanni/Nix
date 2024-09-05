{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "grand-theft-focus@zalckos.github.com" ];
  home.packages = with pkgs; [ gnomeExtensions.grand-theft-focus ];
}
