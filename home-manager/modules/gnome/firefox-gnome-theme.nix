{ config, inputs, ... }:

{
  home.file."firefox-gnome-theme" = {
    source = inputs.firefox-gnome-theme;
    target = ".mozilla/firefox/${config.home.username}/chrome/firefox-gnome-theme";
  };

  programs.firefox = {
    enable = true;

    profiles.${config.home.username} = {
      settings = {
        "browser.tabs.drawInTitlebar" = true;
        "browser.theme.dark-private-windows" = false;
        "browser.uidensity" = 0;
        "browser.uiCustomization.state" = ''
          {"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","new-tab-button","customizableui-special-spring1","urlbar-container","customizableui-special-spring2","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"dirtyAreaCache":["nav-bar","unified-extensions-area","PersonalToolbar","TabsToolbar","toolbar-menubar"],"currentVersion":20,"newElementCount":4}
        '';
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';

      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';
    };
  };
}
