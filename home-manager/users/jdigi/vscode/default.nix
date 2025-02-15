{ pkgs, ... }:

{
  imports = [ ./extensions ];

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;

    package = pkgs.vscode.override {
      commandLineArgs = [
        #"--ozone-platform=wayland" #TODO: app_id is wrong on wayland https://github.com/microsoft/vscode/issues/154693
        "--touch-events"
        "-d" # hack needed to open files with commandLineArgs
      ];
    };

    userSettings = {
      "editor.formatOnSave" = true;
      "git.openRepositoryInParentFolders" = "always";
      "window.autoDetectColorScheme" = true;
      "window.titleBarStyle" = "custom";
    };
  };
}

