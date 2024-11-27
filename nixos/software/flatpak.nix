{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = lib.mkIf config.services.xserver.desktopManager.gnome.enable [
      pkgs.gnome-software
    ];

    services.flatpak.enable = true;

    systemd.services."flathub-add-repo" = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
