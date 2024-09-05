{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" ];

    "org/gnome/shell/extensions/dash-to-dock" = {
      dash-max-icon-size = 64;
      disable-overview-on-startup = true;
      running-indicator-style = "DOTS";
      scroll-action = "cycle-windows";
      show-trash = false;
      transparency-mode = "DYNAMIC";
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.dash-to-dock ];
}
