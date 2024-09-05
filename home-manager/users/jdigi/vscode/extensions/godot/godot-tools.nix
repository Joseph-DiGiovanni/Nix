{ pkgs, ... }:

{
  programs.vscode.extensions = with pkgs.vscode-marketplace; [ geequlim.godot-tools ];
}
