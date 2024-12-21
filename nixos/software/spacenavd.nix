{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ spnavcfg ];
  hardware.spacenavd.enable = true;
  # TODO: Remove once https://github.com/NixOS/nixpkgs/pull/366768 is merged into stable
  systemd.services.spacenavd.wantedBy = [ "graphical.target" ];
}
