{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [ steam ];
}
