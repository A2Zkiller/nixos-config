{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.general = {
    pkgs,
    lib,
    ...
  }: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.nix
    ];

    time.timeZone = lib.mkDefault "America/New_York";

    environment.variables = {
      EDITOR = "hx";
    };

    networking.networkmanager.enable = true;
  };
}
