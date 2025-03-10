{ custom-modules, inputs, nixpkgs, ... }:

with nixpkgs.lib;

let
  mkCommonConfig = builtins.mapAttrs (hostName: extraConfig:
    nixosSystem
      rec {
        modules = [
          custom-modules.nixos.hosts."${hostName}".default
          inputs.disko.nixosModules.disko
          inputs.home-manager.nixosModules.home-manager
          inputs.impermanence.nixosModules.impermanence
          inputs.lanzaboote.nixosModules.lanzaboote
          inputs.nix-index-database.nixosModules.nix-index
          inputs.sops-nix.nixosModules.sops
          {
            home-manager = {
              backupFileExtension = "hmbackup";
              extraSpecialArgs = { inherit inputs; custom-modules = custom-modules.home.modules; };
              sharedModules = [ custom-modules.home.users.common.default ];
              useGlobalPkgs = true;
              useUserPackages = true;
            };

            networking.hostName = mkForce hostName;

            nix = {
              gc = {
                automatic = true;
                dates = "weekly";
              };

              optimise.automatic = true;

              settings = {
                auto-optimise-store = true;
                experimental-features = [ "flakes" "nix-command" ];
              };
            };

            nixpkgs = import ./custom-pkgs.nix { inherit inputs system; };

            sops.age.keyFile = "/nix/sops-nix.key";
            sops.defaultSopsFile = ./secrets/secrets.yaml;
            sops.defaultSopsFormat = "yaml";
            system.stateVersion = "24.05"; # DO NOT CHANGE. https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
          }
        ];

        system = "x86_64-linux";

        specialArgs = {
          inherit custom-modules inputs;
        };
      } // extraConfig
  );

  getHosts = builtins.mapAttrs (name: value: { value = { }; }) custom-modules.nixos.hosts;
in

mkCommonConfig getHosts
