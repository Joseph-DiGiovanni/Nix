{ lib, ... }:

{
  imports = [ ./extensions.nix ];

  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      old-files-age = lib.hm.gvariant.mkUint32 30;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/nautilus/preferences".click-policy = "single";

    "org/gnome/shell" = {
      favorite-apps = lib.mkForce [
        "firefox.desktop"
        "youtube-music.desktop"
        "steam.desktop"
        "discord.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
  };
}
