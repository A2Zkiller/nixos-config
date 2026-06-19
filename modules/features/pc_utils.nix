{...}: {
  flake.nixosModules.pcUtils = {pkgs, ...}: {
    services.lact.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
