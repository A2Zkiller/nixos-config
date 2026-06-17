{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.vmwareGuestAdditions = {...}: {
    services.xserver.videoDrivers = ["vmware"];
    virtualisation.vmware.guest.enable = true;

    environment.variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      XCURSOR_SIZE = "24";
    };

    boot.loader.grub = {
      device = "/dev/sda";
      useOSProber = false;
      efiSupport = false;
      efiInstallAsRemovable = false;
    };
  };
}
