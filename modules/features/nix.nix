{self, inputs, ...}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
      inputs.wrappers.flakeModules.wrappers # Adds support for flake-parts wrapppers
      self.nixosModules.lix
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };
}
