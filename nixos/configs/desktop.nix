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

  nix = {
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "flakes" "nix-command" ];
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  services = {
    localtimed.enable = true;

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
