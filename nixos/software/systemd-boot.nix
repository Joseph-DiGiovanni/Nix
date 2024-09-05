{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        consoleMode = "auto";
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
