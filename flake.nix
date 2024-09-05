{
  description = "Joey's NixOS configuration";

  inputs = {
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    firefox-gnome-theme = {
      flake = false;
      url = "github:rafaelmardojai/firefox-gnome-theme";
    };

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.05";
    };

    lanzaboote = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/lanzaboote";
    };

    nix-vscode-extensions = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-vscode-extensions";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Mic92/sops-nix";
    };
  };

  outputs = inputs @ { disko, haumea, home-manager, nixpkgs, self, sops-nix, ... }:
    let
      loadDir = path: haumea.lib.load {
        loader = haumea.lib.loaders.path;
        src = path;
      };

      custom-modules = {
        home = loadDir ./home-manager;
        nixos = loadDir ./nixos;
      };
    in
    {
      nixosConfigurations = import ./nixos.nix { inherit custom-modules disko home-manager inputs nixpkgs sops-nix; };
    };
}
