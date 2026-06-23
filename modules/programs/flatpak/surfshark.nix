{self, ...}: {
  flake.nixosModules.surfshark = {
    imports = [
      self.nixosModules.flatpak
    ];

    services.flatpak.packages = [
      "com.surfshark.Surfshark"
    ];
  };
}
