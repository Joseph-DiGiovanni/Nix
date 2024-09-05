{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [ jnoortheen.nix-ide ];

    userSettings = {
      nix = {
        enableLanguageServer = true;
        serverPath = "${pkgs.nil}/bin/nil";
        serverSettings = {
          nil = {
            formatting = {
              command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
            };
          };
        };
      };
    };
  };
}
