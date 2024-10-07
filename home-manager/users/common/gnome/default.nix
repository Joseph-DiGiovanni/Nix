{ custom-modules, config, lib, ... }:

{
  imports = with custom-modules.gnome; [
    ./extensions.nix
    ./gnome-console.nix
    ./outline-theme.nix
    firefox-gnome-theme
    steam-adwaita-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-options = "spannedz";
      picture-uri = "file:///home/${config.home.username}/Pictures/Wallpapers/Light.jpg";
      picture-uri-dark = "file:///home/${config.home.username}/Pictures/Wallpapers/Dark.jpg";
    };

    "org/gnome/desktop/datetime".automatic-timezone = false; # TODO: Auto timezone not working since mozilla location service shutdown;

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      show-battery-percentage = true;
      enable-hot-corners = false;
    };

    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      experimental-features = [
        "scale-monitor-framebuffer"
        "variable-refresh-rate" # TODO: May not be needed in gnome 47
      ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
      night-light-temperature = lib.hm.gvariant.mkUint32 4500;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-timeout = 1800;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 900;
      sleep-inactive-battery-timeout-ac = 1800;
      sleep-inactive-battery-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
    };

    "org/gnome/shell/weather".automatic-location = true;
    "org/gnome/system/location".enabled = true;
    "org/gtk/settings/file-chooser".clock-format = "12h";
  };
}
