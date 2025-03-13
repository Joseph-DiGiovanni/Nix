{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    bottles
    darktable
    discord
    element-desktop
    gimp
    github-desktop
    godot_4
    localsend
    obs-studio
    onlyoffice-bin
    openspades
    youtube-music
    via
  ];
}
