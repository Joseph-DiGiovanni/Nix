{ config, lib, pkgs, ... }:

{
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
      "/tmp" # Prevent tmp from filling while using tmpfs
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/flatpak"
      "/var/lib/fprint"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  fileSystems = {
    "/" = lib.mkForce {
      device = "none";
      fsType = "tmpfs";
      options = [ "size=3G" "mode=755" ];
    };

    "/persist".neededForBoot = true;
  };

  systemd = {
    services = {
      timezone-persistence = lib.mkIf (config.time.timeZone == null) {
        # This is required since symlinks cannot be persisted and declaring the timezone makes it immutable
        # See https://github.com/nix-community/impermanence/issues/153
        after = [ "local-fs.target" ];
        description = "Persist /etc/localtime between reboots";

        serviceConfig = {
          ExecStart = pkgs.writeShellScript "restore-timezone" ''
            if ! ${pkgs.coreutils}/bin/test -L /persist/etc/localtime; then
              ${pkgs.coreutils}/bin/echo "Nothing to restore"
              exit 0
            fi
            ${pkgs.coreutils}/bin/ln -sf $(${pkgs.coreutils}/bin/readlink /persist/etc/localtime) /etc/localtime
          '';

          ExecStop = pkgs.writeShellScript "persist-timezone" ''
            ${pkgs.coreutils}/bin/rm -f /persist/etc/localtime
            if ! ${pkgs.coreutils}/bin/test -L /etc/localtime; then
              ${pkgs.coreutils}/bin/echo "Nothing to persist"
              exit 0
            fi
            ${pkgs.coreutils}/bin/mkdir -p /persist/etc
            ${pkgs.coreutils}/bin/cp -P /etc/localtime /persist/etc/localtime
          '';

          RemainAfterExit = true;
          Type = "oneshot";
        };

        unitConfig = {
          RequiresMountsFor = "/persist";
        };

        wantedBy = [ "local-fs.target" ];
      };
    };

    tmpfiles.rules = [ "D! /persist/tmp 1777 root root" ]; # Make sure the new tmp directory is created and cleared on boot
  };
}
