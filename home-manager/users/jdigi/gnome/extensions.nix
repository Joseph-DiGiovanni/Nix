{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    gsconnect
    memento-mori
    quick-settings-audio-devices-hider
    quick-settings-audio-devices-renamer
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/memento-mori" = {
      birth-day = 3;
      birth-month = 11;
      birth-year = 1995;
      life-expectancy = 80;
    };
  };
}
