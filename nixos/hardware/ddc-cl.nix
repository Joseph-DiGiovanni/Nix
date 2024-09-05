{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ ddcutil ];
  hardware.i2c.enable = true;
  users.groups."i2c".members = builtins.attrNames config.users.users;
}
