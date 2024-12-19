{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ spnavcfg ];
  hardware.spacenavd.enable = true;
}
