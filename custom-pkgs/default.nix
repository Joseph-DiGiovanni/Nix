{ inputs, nixpkgs, system, ... }:

let
  customPkgs = final: prev: with nixpkgs.legacyPackages.${system}; {
    adwaita-for-steam = callPackage ./adwaita-for-steam.nix { };
    mkvextract-gtk = callPackage ./mkvextract-gtk.nix { };
    plymouth-theme-neat = callPackage ./plymouth-theme-neat.nix { };
  };

  unstableOverlay = final: prev: {
    alvr = final.unstable.alvr;
    proton-ge-bin = final.unstable.proton-ge-bin;
    sidequest = final.unstable.sidequest;
    unstable = import inputs.nixpkgs-unstable { inherit (final) config system; };
    vscode = final.unstable.vscode;
    youtube-music = final.unstable.youtube-music;
  };

  waylandOverlay = final: prev: {
    github-desktop = mkWaylandElectronWrapper { pkg = prev.github-desktop; };
    vscode = mkWaylandElectronWrapper { pkg = prev.vscode; exeName = "code"; };
  };

  mkWaylandElectronWrapper = { pkg, exeName ? pkg.pname, extraFlags ? "" }: pkg.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/${exeName} \
        --add-flags "--ozone-platform-hint=auto ${extraFlags}"
    '';
  });
in
import nixpkgs {
  inherit system;
  config.allowUnfree = true;

  overlays = [
    customPkgs
    inputs.nix-vscode-extensions.overlays.default
    inputs.nur.overlays.default
    unstableOverlay
    waylandOverlay
  ];
}
