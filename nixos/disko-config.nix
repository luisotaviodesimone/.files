# Example to create a bios compatible gpt partition
{ lib, ... }:
{
  disko.devices = {
    disk.vda = {
      type = "disk";
      device = lib.mkDefault "/dev/vda";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
          };
          esp = {
            name = "ESP";
            size = "500M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # Override existing partition
              # Subvolumes must set a mountpoint in order to be mounted,
              # unless their parent is mounted
              subvolumes = {
                # Subvolume name is different from mountpoint
                "/rootfs" = {
                  mountpoint = "/";
                };
                # Subvolume name is the same as the mountpoint
                "/home" = {
                  mountOptions = [ "compress=zstd" ];
                  mountpoint = "/home";
                };
                # Sub(sub)volume doesn't need a mountpoint as its parent is mounted
                "/home/elliott" = { };
                # Parent is not mounted so the mountpoint must be set
                "/nix" = {
                  mountOptions = [ "compress=zstd" "noatime" ];
                  mountpoint = "/nix";
                };
              };

              mountpoint = "/partition-root";
            };
          };
        };
      };
    };
  };
}
