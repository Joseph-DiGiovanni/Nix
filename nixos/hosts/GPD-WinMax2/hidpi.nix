{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.sharedModules = [
    {
      dconf.settings."org/gnome/shell/extensions/lennart-k/rounded_corners".corner-radius = 7;
    }
  ];
}
