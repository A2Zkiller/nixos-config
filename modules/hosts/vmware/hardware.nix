{self, inputs, ...}: {
  flake.nixosModules.myVmwareHardware = { config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "mptspi" "uhci_hcd" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/bde41692-d2af-4e4a-a9a0-996a69d0c165";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/460c4f38-dd30-4042-b9f0-4ca980b59262"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
};

}
