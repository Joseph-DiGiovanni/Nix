{ pkgs, ... }:

{
  programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [ eddiedover.gdscript-formatter-linter ];
    userSettings."[gdscript]"."editor.defaultFormatter" = "EddieDover.gdscript-formatter-linter";
  };
}
