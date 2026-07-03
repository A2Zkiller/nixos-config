{self, ...}: {
  flake.nixosModules.emacs = {pkgs, ...}: {
    services.emacs = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myEmacs;
      defaultEditor = true;
    };
  };
}
