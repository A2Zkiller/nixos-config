{delib, ...}:
delib.host {
  name = "vmware";

  rice = "catppuccin-mocha";
  type = "desktop";

  nixos = {
    services.xserver.videoDrivers = ["vmware"];
    virtualisation.vmware.guest.enable = true;

    time.timeZone = "America/New_York";
  };
}
