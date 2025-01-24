{ lib, pkgs, ... }:

{
  imports = [ ./gnome ];

  home = {
    file."Pictures/Wallpapers" = lib.mkForce {
      recursive = true;
      source = ./wallpapers;
    };

    packages = with pkgs; [
      discord
      youtube-music
    ];
  };
}
