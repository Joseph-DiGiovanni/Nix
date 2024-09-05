{ lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "quicksettings-audio-devices-renamer@marcinjahn.com" ];

    "org/gnome/shell/extensions/quicksettings-audio-devices-renamer" = with lib.hm.gvariant; {
      input-names-map = [
        (mkDictionaryEntry [
          "Microphone – Antlion Wireless Microphone"
          "ModMic Wireless"
        ])

        (mkDictionaryEntry [
          "Analog Input – CMU-BC1 Multifunction Device"
          "Sony Webcam"
        ])
      ];
      output-names-map = [
        (mkDictionaryEntry [
          "Analog Output – AC511 Sound Bar"
          "Sound Bar"
        ])

        (mkDictionaryEntry [
          "Analog Output – Qudelix-5K USB DAC 96KHz"
          "Qudelix-5K USB DAC"
        ])

        (mkDictionaryEntry [
          "Headset – Pixel Buds Pro 2"
          "Pixel Buds Pro 2"
        ])
      ];
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.quick-settings-audio-devices-renamer ];
}
