let
  latestSourceURL = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
in
{
  programs.firefox.policies.ExtensionSettings = {
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
      # Bitwarden Password Manager
      default_area = "navbar";
      install_url = latestSourceURL "bitwarden-password-manager";
      installation_mode = "normal_installed";
    };

    "{cf02b1a7-a01a-4e37-a609-516a283f1ed3}" = {
      # Ultrawidify
      default_area = "menupanel";
      install_url = latestSourceURL "ultrawidify";
      installation_mode = "normal_installed";
    };

    "addon@darkreader.org" = {
      default_area = "menupanel";
      install_url = latestSourceURL "darkreader";
      installation_mode = "normal_installed";
    };

    "simple-tab-groups@drive4ik" = {
      default_area = "navbar";
      install_url = latestSourceURL "simple-tab-groups";
      installation_mode = "normal_installed";
    };
  };
}
