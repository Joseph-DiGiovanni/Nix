{ pkgs, ... }:

{
  home.packages = with pkgs; [ gdtoolkit_4 ];

  programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [ eddiedover.gdscript-formatter-linter ];
    userSettings."[gdscript]"."editor.defaultFormatter" = "EddieDover.gdscript-formatter-linter";
  };
}
