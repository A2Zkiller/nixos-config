{...}: {
  flake.diskoConfigurations.mainpcConfig = {
    disko.devices = {
      disk = {
        main = {
          device = "/dev/nvme0n1";
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              MBR = {
                type = "EF02";
                size = "1M";
                priority = 1;
              };

              ESP = {
                name = "ESP";
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["umask=0077"];
                };
              };

              swap = {
                name = "swap";
                size = "8G";
                content = {
                  type = "swap";
                  discardPolicy = "both";
                };
              };

              root = {
                name = "root";
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
}
