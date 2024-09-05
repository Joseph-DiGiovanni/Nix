{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    bottles
    darktable
    discord
    element-desktop
    f3d
    foliate
    gimp
    github-desktop
    gpu-screen-recorder-gtk
    handbrake
    localsend
    obs-studio
    onlyoffice-bin
    openspades
    transmission-gtk
    youtube-music
    via
  ];
}
