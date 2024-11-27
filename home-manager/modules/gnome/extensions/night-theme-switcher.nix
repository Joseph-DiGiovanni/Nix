{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "nightthemeswitcher@romainvigier.fr" ];

    "org/gnome/shell/extensions/nightthemeswitcher/commands" = {
      enabled = true;
      sunrise = "gsettings set org.gnome.desktop.interface gtk-theme Adwaita";
      sunset = "gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark";
    };

    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
      manual-schedule = false;
    };
  };

  home.packages = with pkgs; [
    gnome-themes-extra # For Adwaita-dark theme
    gnomeExtensions.night-theme-switcher
  ];
}
