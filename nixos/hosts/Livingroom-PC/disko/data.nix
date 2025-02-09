let
  btrfOptions = [ "compress=zstd" ];
  ssdOptions = [ "discard=async" "noatime" ];
in
{
  disko.devices.disk.data = {
    device = "/dev/disk/by-id/ata-CT2000MX500SSD1_2023E2A97A7A";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        data = {
          label = "Data";
          size = "100%";

          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];

            subvolumes = {
              "/home" = {
                mountpoint = "/home";
                mountOptions = btrfOptions ++ ssdOptions;
              };

              "/home/.snapshots" = { };

              "/persist" = {
                mountpoint = "/persist";
                mountOptions = btrfOptions ++ ssdOptions;
              };
            };
          };
        };
      };
    };
  };
}
