{ config, inputs, lib, pkgs, ... }:

let
  UUID = "monitor-brightness-volume@ailin.nemui";
  lightModeBrightness = 100;
  darkModeBrightness = 50;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf config.services.xserver.displayManager.gdm.enable {
    home-manager.sharedModules = [
      {
        dconf.settings = {
          "org/gnome/shell".enabled-extensions = [ UUID ];

          "org/gnome/shell/extensions/monitor-brightness-volume".show-volume = false;
        };

        systemd.user.services.ddcutil-auto-brightness-gnome = {
          Install.WantedBy = [ "graphical-session.target" ];

          Service = {
            ExecStart = pkgs.writeShellScript "ddcutil-auto-brightness-gnome" ''
              ${pkgs.glib}/bin/gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
                ${pkgs.gnome.gnome-shell}/bin/gnome-extensions disable ${UUID} # Reload the extension to detect the brightness change
                if [[ "$line" == *"prefer-dark"* ]]; then
                  ${pkgs.ddcutil}/bin/ddcutil setvcp 10 ${toString darkModeBrightness}
                else
                  ${pkgs.ddcutil}/bin/ddcutil setvcp 10 ${toString lightModeBrightness}
                fi
                # Reload the extension to apply the brightness change
                ${pkgs.gnome.gnome-shell}/bin/gnome-extensions enable ${UUID}
              done
            '';
            Restart = "always";
            RestartSec = 10;
          };

          Unit.Description = "ddcutil auto brightness service for GNOME";
        };

        home.packages = with pkgs; [ gnomeExtensions.control-monitor-brightness-and-volume-with-ddcutil ];
      }
    ];
  };
}
