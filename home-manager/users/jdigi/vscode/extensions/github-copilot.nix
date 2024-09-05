{ pkgs, ... }:

{
  programs.vscode = {
    extensions = with pkgs.vscode-marketplace-release; [
      github.copilot
      github.copilot-chat
    ];

    userSettings."github.copilot.editor.enableAutoCompletions" = true;
  };
}
