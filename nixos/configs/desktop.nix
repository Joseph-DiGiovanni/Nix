{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    auto-wlan
    flatpak
    gnome
    localsend
    pipewire
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

  time.timeZone = "America/New_York";
  users.mutableUsers = false;
}
