{self, inputs, ...}: {
  flake.nixosModules.general = {pkgs, ...}: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.nix
    ];

    networking.networkmanager.enable = true;
  };
}
