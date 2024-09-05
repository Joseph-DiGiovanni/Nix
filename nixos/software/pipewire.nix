{ lib, ... }:

{
  hardware.pulseaudio.enable = lib.mkForce false;
  security.rtkit.enable = true;

  services.pipewire = {
    alsa = {
      enable = true;
      support32Bit = true;
    };

    enable = true;
    pulse.enable = true;
  };
}
