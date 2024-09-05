{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    rounded-window-corners-reborn
  ];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
    "org/gnome/shell/extensions/user-theme".name = "Outline Theme";
  };

  home.file.".local/share/themes/Outline Theme/gnome-shell/gnome-shell.css".text = ''
    #panel {
        outline: 3px solid black;
    }

    .quick-settings, .quick-toggle-menu, .quick-toggle-menu, .search-entry, .dash-background, .osd-window, .search-section-content, .tile-preview, #keyboard, .keyboard-key, .window-close, .notification-banner, .app-folder:selected:active , .screenshot-ui-close-button, .screenshot-ui-panel, .prompt-dialog, .modal-dialog, .popup-menu-content {
        border: 3px solid black;
    }
  '';
}
