{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./file-systems.nix
    ./gdm/monitors
    ./hidpi.nix
    ./home-manager
    configs.desktop
    configs.desktop-extras
    configs.gaming
    configs.secureboot # Must be commented on first install
    hardware.gpd-win-max-2
    users.jdigi
  ];

  services = {
    displayManager.autoLogin.user = "jdigi";
    logind.lidSwitchExternalPower = "ignore";
  };
}
