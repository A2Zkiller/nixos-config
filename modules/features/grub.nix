{ delib, ... }:
delib.module {
  name = "features.grub";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
}
