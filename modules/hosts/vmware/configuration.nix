{
  self,
  inputs,
  getSystem,
  ...
}: {
  flake.nixosModules.myVmwareConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.myVmwareHardware
      self.nixosModules.vmwareGuestAdditions
      self.nixosModules.desktop
      self.nixosModules.grub
    ];

    networking.hostName = "myVmware"; # Define your hostname.

    time.timeZone = "America/New_York";

    system.stateVersion = "26.05";
  };
}
