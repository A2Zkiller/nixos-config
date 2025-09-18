{
  delib,
  host,
  lib,
  ...
}:
delib.module {
  name = "features.grub";

  options = with delib;
    moduleOptions {
      enable = boolOption true;
      device = strOption "/dev/sda";
    };

  nixos.ifEnabled = {cfg, ...}: {
    boot.loader.grub = {
      enable = true;
      useOSProber = true;

      device = lib.optionals (host.isPC) cfg.device;
    };
  };
}
