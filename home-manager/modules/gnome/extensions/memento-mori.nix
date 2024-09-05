{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "memento-mori@paveloom" ];

    "org/gnome/shell/extensions/memento-mori" = {
      extension-index = 1;
      extension-position = "left";
    };
  };
  home.packages = with pkgs; [ gnomeExtensions.memento-mori ];
}
