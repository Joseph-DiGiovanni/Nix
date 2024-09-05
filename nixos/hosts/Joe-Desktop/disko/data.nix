let
  btrfOptions = [ "compress=zstd" ];
  ssdOptions = [ "discard=async" "noatime" ];
in
{
  disko.devices.disk.data = {
    device = "/dev/disk/by-id/nvme-WD_BLACK_SN770_2TB_23462Z806057";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        data = {
          label = "Data";
          size = "100%";

          content = {
            type = "luks";
            name = "luksdata";
            settings.allowDiscards = true;

            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];

              subvolumes = {
                "/home" = {
                  mountpoint = "/home";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/home/.snapshots" = { };
              };
            };
          };
        };
      };
    };
  };
}
