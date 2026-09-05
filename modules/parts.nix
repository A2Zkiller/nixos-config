{
  self,
  inputs,
  ...
}: {
  systems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-linux"
    "aarch64-darwin"
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      config.allowUnfree = true;

      # FIX: xwayland-satellite overlay
      overlays = [
        (final: prev: {
          xwayland-satellite =
            (import inputs.nixpkgs-xwayland-satellite {
              system = prev.stdenv.hostPlatform.system;
            }).xwayland-satellite;
        })
      ];
    };
  };
}
