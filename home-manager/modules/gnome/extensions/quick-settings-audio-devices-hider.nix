{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "quicksettings-audio-devices-hider@marcinjahn.com" ];

    "org/gnome/shell/extensions/quicksettings-audio-devices-hider" = {
      excluded-input-names = [
        "Digital Input (S/PDIF) – AC511 Sound Bar"
        "Digital Input (S/PDIF) – CMU-BC1 Multifunction Device"
        "Line In – AC511 Sound Bar"
      ];

      excluded-output-names = [
        "Digital Output (S/PDIF) – AC511 Sound Bar"
        "Digital Output (S/PDIF) – Qudelix-5K USB DAC 96KHz"
      ];
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.quick-settings-audio-devices-hider ];
}
