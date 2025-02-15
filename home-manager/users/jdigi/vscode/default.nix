{ ... }:

{
  imports = [ ./extensions ];

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;

    userSettings = {
      "editor.formatOnSave" = true;
      "git.openRepositoryInParentFolders" = "always";
      "window.autoDetectColorScheme" = true;
      "window.titleBarStyle" = "custom";
    };
  };
}

