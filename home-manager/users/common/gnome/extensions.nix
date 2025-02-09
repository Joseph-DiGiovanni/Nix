{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    alphabetical-app-grid
    bluetooth-battery-meter
    bottom-overview
    caffeine
    #compiz-windows-effect # Conflicts with outline theme
    hibernate-status-button
    maximize-to-empty-workspace
    gnome-rounded-corners
    grand-theft-focus
    night-theme-switcher
  ];

  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    disabled-extensions = [ ];
    enabled-extensions = [ "light-style@gnome-shell-extensions.gcampax.github.com" ];
  };
}
