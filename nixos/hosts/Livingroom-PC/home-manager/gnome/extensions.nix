{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    caffeine
    hide-top-bar
    no-titlebar-when-maximized
  ];
}
