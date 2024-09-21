{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./disko/root.nix
    configs.luks
    configs.snapper
  ];
}
