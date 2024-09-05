{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nufraw-thumbnailer # RAW image thumbnailer
    icoextract # Windows executable thumbnailer
  ];
}
