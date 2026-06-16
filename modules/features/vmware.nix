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
  };
}
