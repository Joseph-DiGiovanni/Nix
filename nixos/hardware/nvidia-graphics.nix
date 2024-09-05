{
  hardware.nvidia = {
    enable = true;
    modesetting.enable = true;
    powerManagement.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
