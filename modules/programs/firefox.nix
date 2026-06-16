{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.librewolf = {pkgs, ...}: {
    programs.firefox = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myLibrewolf;
    };
  };
}
