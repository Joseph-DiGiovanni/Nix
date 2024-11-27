{ config, inputs, lib, pkgs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      evince
      geary
      gnome-connections
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-tour
      simple-scan
      totem
      yelp
    ];

    systemPackages = with pkgs; [
      celluloid
      decibels
      video-trimmer
    ];
  };

  programs.dconf = {
    enable = true;
    profiles.gdm.databases = [
      {
        settings = {
          "org/gnome/desktop/interface" = {
            clock-format = "12h";
            show-battery-percentage = true;
          };

          "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";

          "org/gnome/mutter".experimental-features = [
            "scale-monitor-framebuffer"
            "variable-refresh-rate" # TODO: May not be needed in gnome 48
          ];

          "org/gnome/settings-daemon/plugins/color" = {
            night-light-enabled = true;
            night-light-schedule-automatic = true;
            night-light-temperature = inputs.home-manager.lib.hm.gvariant.mkUint32 4500;
          };
        };
      }
    ];
  };

  services = {
    fwupd.enable = lib.mkDefault true;
    gnome.gnome-keyring.enable = lib.mkDefault true;

    xserver = {
      enable = lib.mkForce true;
      desktopManager.gnome.enable = lib.mkForce true;
      displayManager.gdm.enable = lib.mkForce true;

      excludePackages = with pkgs; [ xterm ];
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services = lib.mkIf config.services.displayManager.autoLogin.enable {
    "autovt@tty1".enable = lib.mkForce false;
    "getty@tty1".enable = lib.mkForce false;
  };

  users.groups."networkmanager".members = builtins.attrNames config.users.users;
}
