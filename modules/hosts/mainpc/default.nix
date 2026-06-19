{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.mainpc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mainpcConfiguration
    ];
  };
}
