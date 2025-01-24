{ inputs, nixpkgs, system, ... }:

let
  customPkgs = final: prev: with nixpkgs.legacyPackages.${system}; {
    adwaita-for-steam = callPackage ./adwaita-for-steam.nix { };
    mkvextract-gtk = callPackage ./mkvextract-gtk.nix { };
    plymouth-theme-neat = callPackage ./plymouth-theme-neat.nix { };
  };

  unstableOverlay = final: prev: {
    alvr = final.unstable.alvr;
    gpu-screen-recorder-gtk = final.unstable.gpu-screen-recorder-gtk;
    proton-ge-bin = final.unstable.proton-ge-bin;
    sidequest = final.unstable.sidequest;
    unstable = import inputs.nixpkgs-unstable { inherit (final) config system; };
  };
in
import nixpkgs {
  inherit system;
  config.allowUnfree = true;

  overlays = [
    customPkgs
    inputs.nix-vscode-extensions.overlays.default
    unstableOverlay
  ];
}
