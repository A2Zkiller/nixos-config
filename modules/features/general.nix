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

    users.users."a2z" = {
      isNormalUser = true;
      description = "a2z's account";
      extraGroups = ["wheel" "networkmanager"];

      initialPassword = "12345";

      shell = selfpkgs.myFish;
    };

    time.timeZone = lib.mkDefault "America/New_York";

    environment.variables = {
      EDITOR = "hx";
    };

    networking.networkmanager.enable = true;
  };
}
