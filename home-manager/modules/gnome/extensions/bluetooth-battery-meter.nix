{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "Bluetooth-Battery-Meter@maniacx.github.com" ];
    "org/gnome/shell/extensions/Bluetooth-Battery-Meter" = {
      enable-battery-level-text = true;
      level-indicator-color = 0; # 0: white, 1: colored, 2: custom
      level-indicator-type = 1; # 0: bar, 1: dots
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.bluetooth-battery-meter ];
}
