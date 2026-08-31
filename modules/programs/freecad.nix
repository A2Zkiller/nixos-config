{
  flake.nixosModules.freecad = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.freecad
    ];
  };
}
