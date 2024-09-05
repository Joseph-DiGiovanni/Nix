{ pkgs, ... }:

{
  home.file.".local/share/Steam" = {
    source = pkgs.adwaita-for-steam.override {
      extraOptions = [
        "library/hide_whats_new"
      ];
    };
    recursive = true;
  };

  systemd.user.services = {
    "adwaita-for-steam-install" = {
      Unit = {
        Description = "Install Adwaita for Steam";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service.ExecStart = pkgs.writeShellScript "adwaita-for-steam-css-patcher" ''
        cd ~/.local/share/Steam/steamui/css/

        if ! test -f "library.css"; then
          echo "Steam library.css not found, make sure that you have succesfully executed Steam once!"
          exit 1;
        fi

        if ! ${pkgs.gnugrep}/bin/grep -Fxq "/*patched*/" library.css; then
          echo "Patching steam library..."
          ${pkgs.coreutils}/bin/mv library.css library.original.css
          ${pkgs.coreutils}/bin/touch library.css
          echo "/*patched*/
          @import url("https://steamloopback.host/css/library.original.css");
          @import url("https://steamloopback.host/libraryroot.custom.css");" >> library.css

          # Pad new library file until it has the same size as the original
          ${pkgs.coreutils}/bin/truncate -r library.original.css library.css
          echo "Done."
        else
          echo "Steam library is already patched, nothing to do."
        fi
      '';
    };

    # Run this service manually prior to removing the theme configuration
    # Alternatively just remove ~/.local/share/Steam/steamui/css/library.css
    "adwaita-for-steam-uninstall" = {
      Unit = {
        Description = "Uninstall Adwaita for Steam";
      };
      Service.ExecStart = pkgs.writeShellScript "adwaita-for-steam-uninstaller" ''
        cd ~/.local/share/Steam/steamui/css/

        if ! test -f "library.original.css"; then
          echo "Original library.css not found, nothing to undo."
          exit 1
        fi

        echo "Restoring original Steam library.css..."
        ${pkgs.coreutils}/bin/mv library.original.css library.css
        echo "Done."
      '';
    };
  };
}
