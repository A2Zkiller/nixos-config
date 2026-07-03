{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.general = {
    pkgs,
    lib,
    config,
    ...
  }: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    user = config.preferences.user.name;
  in {
    imports = [
      self.nixosModules.nix
      self.nixosModules.base
    ];

    users.users.${user} = {
      isNormalUser = true;
      description = "${user}'s account";
      extraGroups = ["wheel" "networkmanager"];

      initialPassword = "12345";

      shell = selfpkgs.myFish;
    };

    services.udisks2.enable = true;

    time.timeZone = lib.mkDefault "America/New_York";

    environment.variables = {
      EDITOR = lib.mkDefault "hx";
    };

    networking.networkmanager.enable = true;

    # TEMP: Fix pnpm insecure
    nixpkgs.config.permittedInsecurePackages = [
      "pnpm-10.29.2"
    ];

    documentation.man.cache.enable = true;
  };
}
