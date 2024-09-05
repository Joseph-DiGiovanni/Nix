{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.sharedModules = [ ./wallpaper-override ];
}
