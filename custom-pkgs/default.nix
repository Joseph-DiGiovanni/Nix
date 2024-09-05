{ inputs, nixpkgs, system, ... }:

let
  customPkgs = final: prev: with nixpkgs.legacyPackages.${system}; {
    adwaita-for-steam = callPackage ./adwaita-for-steam.nix { };
    alvr = callPackage ./alvr { };
    mkvextract-gtk = callPackage ./mkvextract-gtk.nix { };
    plymouth-theme-neat = callPackage ./plymouth-theme-neat.nix { };
  };

  unstableOverlay = final: prev: {
    decibels = final.unstable.decibels; # TODO: remove in next release

    gnomeExtensions = prev.gnomeExtensions // {
      maximize-to-empty-workspace = final.unstable.gnomeExtensions.maximize-to-empty-workspace; # TODO: Remove when version 14 is in stable
      hide-top-bar = final.unstable.gnomeExtensions.hide-top-bar; # TODO: Remove when version 117 is in stable
      rounded-window-corners-reborn = final.unstable.gnomeExtensions.rounded-window-corners-reborn; # TODO: Remove in next release
    };

    gpu-screen-recorder-gtk = final.unstable.gpu-screen-recorder-gtk;
    icoextract = final.unstable.icoextract; # TODO: remove in next release
    proton-ge-bin = final.unstable.proton-ge-bin;
    sidequest = final.unstable.sidequest;
    unstable = import inputs.nixpkgs-unstable { inherit (final) config system; };
    vscode = final.unstable.vscode;
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
