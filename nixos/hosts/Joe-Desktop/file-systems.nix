{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./disko/data.nix
    ./disko/root.nix
    configs.luks
    configs.snapper
  ];
}
