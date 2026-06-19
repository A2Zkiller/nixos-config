{...}: {
  flake.diskoConfigurations.mainpcConfig = {
    disko.devices = {
      disk = {
        main = {
          device = "/dev/CHANGE_ME"; # TODO: Update device name on install
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
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
