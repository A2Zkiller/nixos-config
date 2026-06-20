{self, ...}: {
  flake.nixosModules.sober = {
    imports = [
      self.nixosModules.flatpak
    ];

    services.flatpak.packages = [
      "org.vinegarhq.Sober"
    ];
  };
}
