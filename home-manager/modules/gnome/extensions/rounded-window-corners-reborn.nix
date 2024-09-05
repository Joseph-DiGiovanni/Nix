{ lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "rounded-window-corners@fxgn" ];

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = with lib.hm.gvariant; {
      border-color = mkTuple [ 0.0 0.0 0.0 1.0 ];
      border-width = 3;
      skip-libadwaita-app = false;
      skip-libhandy-app = false;
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.rounded-window-corners-reborn ];
}
