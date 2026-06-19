{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    ...
  }: {
    hardware.graphics.enable = lib.mkDefault true;

    programs.steam = {
      enable = true;
      protontricks.enable = true;
    };

    environment.systemPackages = [
      pkgs.prismlauncher
    ];
  };
}
