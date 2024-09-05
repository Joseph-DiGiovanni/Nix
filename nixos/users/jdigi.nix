{ config, custom-modules, inputs, ... }:

let
  username = "jdigi";
  fullname = "Joseph DiGiovanni";
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  sops.secrets."users/${username}".neededForUsers = true;

  home-manager.users.${username} = custom-modules.home.users.${username}.default;

  users.users.${username} = {
    description = fullname;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets."users/${username}".path;
    isNormalUser = true;
  };
}
