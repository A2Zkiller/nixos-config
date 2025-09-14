{delib, ...}:
delib.overlayModule {
  name = "features.lix";

  overlay = final: prev: {
    inherit
      (final.lixPackageSets.stable)
      nixpkgs-review
      nix-direnv
      nix-eval-jobs
      nix-fast-build
      colmena
      ;
  };
}
