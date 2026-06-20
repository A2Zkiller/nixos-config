{inputs, ...}: {
  flake.nixosModules.flatpak = {
    services.flatpak.enable = true;

    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];
  };
}
