{ lib, pkgs, ... }:

{
  programs.steam = {
    dedicatedServer.openFirewall = lib.mkDefault true;
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    localNetworkGameTransfers.openFirewall = lib.mkDefault true;
    remotePlay.openFirewall = lib.mkDefault true;
  };
}
