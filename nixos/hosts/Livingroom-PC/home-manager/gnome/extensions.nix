{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    hide-top-bar
    no-titlebar-when-maximized
  ];
}
