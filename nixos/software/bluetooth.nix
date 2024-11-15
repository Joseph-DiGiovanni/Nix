{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    # Temporary fix for bluetooth not able to reconnect after sleep or reboot
    # https://github.com/bluez/bluez/issues/973
    package = pkgs.unstable.bluez; # TODO: Remove this once patched in stable
  };
}
