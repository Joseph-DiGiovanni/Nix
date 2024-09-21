let
  btrfOptions = [ "compress=zstd" ];
  ssdOptions = [ "discard=async" "noatime" ];
in
{
  disko.devices.disk.root = {
    device = "/dev/disk/by-id/ata-TS512GMTS400S_E974850004";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        efi = {
          type = "EF00";
          size = "512M";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        root = {
          label = "NixOS";
          size = "100%";

          content = {
            type = "luks";
            name = "luksroot";
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

                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/root" = {
                  mountpoint = "/";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/swap" = {
                  mountpoint = "/.swap";
                  swap.swapfile.size = "4G";
                };
              };
            };
          };
        };
      };
    };
  };
}
