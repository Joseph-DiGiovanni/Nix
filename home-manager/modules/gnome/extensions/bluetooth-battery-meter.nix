{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "Bluetooth-Battery-Meter@maniacx.github.com" ];
    "org/gnome/shell/extensions/Bluetooth-Battery-Meter".enable-battery-level-text = true;
  };

  home.packages = with pkgs; [ gnomeExtensions.bluetooth-battery-meter ];
}
