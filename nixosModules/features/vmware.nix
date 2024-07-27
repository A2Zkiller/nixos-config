{ pkgs, ... }:
{
  services.xserver.videoDrivers = [ "vmware" ];

  virtualisation.vmware.guest.enable = true;
}
