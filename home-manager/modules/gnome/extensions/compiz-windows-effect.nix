{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "compiz-windows-effect@hermes83.github.com" ];

    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      friction = 3.5;
      mass = 80.0;
      maximize-effect = false;
      resize-effect = false;
      speedup-factor-divider = 7.0;
      spring-k = 10.0;
    };
  };

  home.packages = with pkgs; [ gnomeExtensions.compiz-windows-effect ];
}
