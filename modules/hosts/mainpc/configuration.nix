{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mainpcConfiguration = {pkgs, ...}: {
    imports = [
      self.nixosModules.mainpcHardware

      self.nixosModules.desktop

      self.nixosModules.grub
      self.nixosModules.zram

      self.nixosModules.pcUtils
      self.nixosModules.media

      inputs.disko.nixosModules.disko
      self.diskoConfigurations.mainpcConfig
    ];

    networking.hostName = "mainpc";

    time.timeZone = "America/New_York";

    environment.systemPackages = [
      pkgs.vesktop
    ];

    boot.initrd.kernelModules = ["amdgpu"];
    hardware.amdgpu.overdrive.enable = true;

    hardware.cpu.amd.updateMicrocode = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    system.stateVersion = "26.05";
  };
}
