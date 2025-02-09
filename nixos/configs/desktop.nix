{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    appimage
    auto-wlan
    flatpak
    geoclue2
    gnome
    localsend
    pipewire
    pipewire-virtual-surround
    plymouth
    systemd-boot
    systemd-wait-online
  ];

  hardware.enableRedistributableFirmware = true;

  networking = {
    firewall.enable = true;

    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    ntp.enable = true;
    printing.enable = true;
  };

  users.mutableUsers = false;
}
