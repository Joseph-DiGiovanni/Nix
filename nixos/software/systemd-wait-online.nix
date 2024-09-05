{ config, lib, ... }:

{
  boot.initrd.systemd.network.wait-online.enable = lib.mkDefault (!config.networking.networkmanager.enable);
  systemd.network.wait-online.enable = lib.mkDefault (!config.networking.networkmanager.enable);
}
