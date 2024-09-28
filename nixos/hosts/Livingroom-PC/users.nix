{ config, ... }:

let
  newUser = extras: {
    extraGroups = [ "networkmanager" ];
    isNormalUser = true;
  } // extras;

  sopsPath = "hosts/livingroom-pc/users";
in
{
  home-manager.users = {
    joey = { };
    kelcie = { };
    mia = { };
  };

  sops.secrets = {
    "${sopsPath}/joey".neededForUsers = true;
    "${sopsPath}/kelcie".neededForUsers = true;
    "${sopsPath}/mia".neededForUsers = true;
  };

  users.users = {
    joey = newUser {
      description = "Joey";
      extraGroups = [ "wheel" ];
      hashedPasswordFile = config.sops.secrets."${sopsPath}/joey".path;
    };
    kelcie = newUser {
      description = "Kelcie";
      hashedPasswordFile = config.sops.secrets."${sopsPath}/kelcie".path;
    };
    mia = newUser {
      description = "Mia";
      hashedPasswordFile = config.sops.secrets."${sopsPath}/mia".path;
    };
  };
}

  