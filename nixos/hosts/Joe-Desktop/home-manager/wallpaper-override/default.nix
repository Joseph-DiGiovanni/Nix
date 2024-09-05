{ lib, ... }:

{
  home = {
    file."Pictures/Wallpapers" = lib.mkForce {
      recursive = true;
      source = ./wallpapers;
    };
  };
}
