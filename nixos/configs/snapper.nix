{
  services.snapper.configs = {
    home = {
      SUBVOLUME = "/home";
      TIMELINE_CLEANUP = true;
      TIMELINE_CREATE = true;
      TIMELINE_LIMIT_DAILY = 7;
      TIMELINE_LIMIT_HOURLY = 6;
      TIMELINE_LIMIT_MONTHLY = 3;
      TIMELINE_LIMIT_WEEKLY = 4;
    };
  };
}

