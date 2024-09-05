{ pkgs, ... }:

{
  dconf.settings."org/gnome/shell".enabled-extensions = [ "MaximizeToEmptyWorkspace-extension@kaisersite.de" ];
  home.packages = with pkgs; [ gnomeExtensions.maximize-to-empty-workspace ];
}
