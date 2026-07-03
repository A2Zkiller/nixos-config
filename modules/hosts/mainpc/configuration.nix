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
      self.nixosModules.gaming

      self.nixosModules.emacs
      self.nixosModules.libreoffice

      self.nixosModules.sober
      self.nixosModules.surfshark

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

      pkgs.zotero

      pkgs.alsa-scarlett-gui

      pkgs.yubioath-flutter
    ];

    services.pcscd.enable = true;

    preferences.monitors = [
      {
        name = "DP-1";
        resolution = "2560x1440";
      }
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.initrd.kernelModules = ["amdgpu"];
    hardware.amdgpu.overdrive.enable = true;

    hardware.cpu.amd.updateMicrocode = true;

    boot.tmp.cleanOnBoot = true;

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    # Keychron launcher setup
    services.udev.extraRules = ''
      # Keychron hidraw (Needed for WebUSB access on Chromium browsers)
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="users", TAG+="uaccess"

      # Configure USB (Example)
      SUBSYSTEM=="usb",  ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0b30", MODE="0660", GROUP="users", TAG+="uaccess"
    '';

    system.stateVersion = "26.05";
  };
}
