{ lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "rounded-window-corners@fxgn" ];

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = with lib.hm.gvariant; {
      border-width = 3;

      global-rounded-corner-settings = [
        (mkDictionaryEntry [
          "padding"
          (mkVariant [
            (mkDictionaryEntry [ "left" (mkUint32 1) ])
            (mkDictionaryEntry [ "right" (mkUint32 1) ])
            (mkDictionaryEntry [ "top" (mkUint32 1) ])
            (mkDictionaryEntry [ "bottom" (mkUint32 1) ])
          ])
        ])
        (mkDictionaryEntry [
          "keepRoundedCorners"
          (mkVariant [
            (mkDictionaryEntry [ "maximized" false ])
            (mkDictionaryEntry [ "fullscreen" false ])
          ])
        ])
        (mkDictionaryEntry [ "borderRadius" (mkVariant (mkUint32 12)) ])
        (mkDictionaryEntry [ "smoothing" (mkVariant 0.0) ])
        (mkDictionaryEntry [
          "borderColor"
          (mkVariant (mkTuple [
            0.0
            0.0
            0.0
            1.0
          ]))
        ])
        (mkDictionaryEntry [ "enabled" (mkVariant true) ])
      ];

      settings-version = mkUint32 7;
      skip-libadwaita-app = false;
      skip-libhandy-app = false;
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.rounded-window-corners-reborn ];
}
