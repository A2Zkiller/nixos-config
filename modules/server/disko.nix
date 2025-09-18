{
  delib,
  host,
  inputs,
  ...
}:
delib.module {
  name = "server.disko";

  options = with delib;
    moduleOptions {
      enable = boolOption host.isServer;
      device = strOption "/dev/vda";
    };

  nixos.ifEnabled = {cfg, ...}: {
    disko.devices = {
      disk.disk1 = {
        inherit (cfg) device;
        type = "disk";
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
              name = "root";
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          };
        };
      };
      lvm_vg = {
        pool = {
          type = "lvm_vg";
          lvs = {
            root = {
              size = "100%FREE";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [
                  "defaults"
                ];
              };
            };
          };
        };
      };
    };
  };

  nixos.always.imports = [inputs.disko.nixosModules.disko];
}
