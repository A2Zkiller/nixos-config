{
  flake.nixosModules.uget = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.aria2
      pkgs.uget
    ];
  };
}
