{ custom-modules, disko, home-manager, inputs, nixpkgs, sops-nix, ... }:

with nixpkgs.lib;

let
  mkCommonConfig = builtins.mapAttrs (hostName: extraConfig:
    nixosSystem
      rec {
        modules = [
          custom-modules.nixos.hosts."${hostName}".default
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
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

            sops.age.keyFile = "/var/lib/sops-nix/key.txt";
            sops.defaultSopsFile = ./secrets/secrets.yaml;
            sops.defaultSopsFormat = "yaml";
            system.stateVersion = "24.05"; # DO NOT CHANGE. https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
          }
        ];

        system = "x86_64-linux";

        specialArgs = {
          inherit custom-modules inputs;
          pkgs = import ./custom-pkgs { inherit inputs nixpkgs system; };
        };
      } // extraConfig
  );

  getHosts = builtins.mapAttrs (name: value: { value = { }; }) custom-modules.nixos.hosts;
in

mkCommonConfig getHosts
