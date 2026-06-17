{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.general = {pkgs, ...}: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.nix
    ];

    environment.variables = {
      EDITOR = "hx";
    };

    networking.networkmanager.enable = true;
  };
}
