{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/Console" =
      let
        fontSize = 12;
        fontWidth = 8;
        lineSpacing = 2 * 2; # Each line has a space above and below it

        terminalMode = {
          # Based on VT100 video modes
          standard = [ 80 24 ];
          standardTall = [ 80 43 ];
          extendedWide = [ 132 24 ];
          extended = [ 132 43 ];
        };

        terminalSize = terminalMode.extended;
      in
      {
        custom-font = "Unifont " + toString fontSize;

        last-window-size = with builtins; lib.hm.gvariant.mkTuple [
          (ceil ((elemAt terminalSize 0 * fontWidth) + 12))
          (ceil (((elemAt terminalSize 1 + .5) * (fontSize + lineSpacing)) + 48))
        ];

        theme = "night";
        use-system-font = false;
      };
  };
}
