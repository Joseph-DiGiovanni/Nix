{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.sharedModules = [ ./audio-device-renamer.nix ];
}
