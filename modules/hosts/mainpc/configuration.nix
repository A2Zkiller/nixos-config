{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mainpcConfiguration = {pkgs, ...}: {
    imports = [
      self.nixosModules.mainpcHardware

      self.nixosModules.grub
      self.nixosModules.zram

      self.nixosModules.desktop

      self.nixosModules.libreoffice

      self.nixosModules.sober

      self.services.wlsunset

      self.nixosModules.pcUtils
      self.nixosModules.media

      inputs.disko.nixosModules.disko
      self.diskoConfigurations.mainpcConfig
    ];

    networking.hostName = "mainpc";

    time.timeZone = "America/New_York";
    time.hardwareClockInLocalTime = true;

    environment.systemPackages = [
      pkgs.vesktop

      pkgs.mangohud
      pkgs.alsa-scarlett-gui
    ];

    preferences.monitors = [
      {
        name = "DP-1";
        resolution = "2560x1440";
      }
    ];

    boot.initrd.kernelModules = ["amdgpu"];
    hardware.amdgpu.overdrive.enable = true;

    hardware.cpu.amd.updateMicrocode = true;

    boot.tmp.cleanOnBoot = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    system.stateVersion = "26.05";
  };
}
