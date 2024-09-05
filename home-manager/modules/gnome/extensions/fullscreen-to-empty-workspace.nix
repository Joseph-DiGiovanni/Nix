{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "fullscreen-to-empty-workspace@aiono.dev" ];
  home.packages = with pkgs; [ gnomeExtensions.fullscreen-to-empty-workspace ];
}
