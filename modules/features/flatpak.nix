{inputs, ...}: {
  flake.nixosModules.flatpak = {
    pkgs,
    lib,
    ...
  }: {
    services.flatpak = {
      enable = true;
    };

    # TEMP: Fix flatpak glycin issue by setting flatpak version to pinned 1.16.6
    nixpkgs.overlays = [
      (final: prev: {
	flatpak = (import inputs.nixpkgs-flatpak {
	  system = prev.stdenv.hostPlatform.system;
	  config.allowUnfree = true;
	}).flatpak;
      })
    ];

    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];
  };
}
