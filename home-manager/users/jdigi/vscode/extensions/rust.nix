{ pkgs, ... }:

{
  programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [
      rust-lang.rust-analyzer
    ];
  };
}
