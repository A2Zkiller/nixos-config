{...}: {
  flake.nixosModules.grub = {lib, ...}: {
    boot.loader.grub = {
      enable = true;
      device = lib.mkDefault "nodev";
      efiSupport = lib.mkDefault true;
      efiInstallAsRemovable = lib.mkDefault true;
      useOSProber = lib.mkDefault true;
    };

    boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;
  };
}
