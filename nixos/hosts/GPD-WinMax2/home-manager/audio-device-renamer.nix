{ lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "quicksettings-audio-devices-renamer@marcinjahn.com" ];

    "org/gnome/shell/extensions/quicksettings-audio-devices-renamer" = with lib.hm.gvariant; {
      output-names-map = [
        (mkDictionaryEntry [
          "Internal Microphone – Family 17h/19h HD Audio Controller"
          "Internal Microphone"
        ])

        (mkDictionaryEntry [
          "Speakers – Family 17h/19h HD Audio Controller"
          "Speakers"
        ])
      ];
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.quick-settings-audio-devices-renamer ];
}
