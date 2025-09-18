{
  delib,
  host,
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
      efiSupport = true;

      device =
        if host.isPC
        then cfg.device
        else "";
    };
  };
}
