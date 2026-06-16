{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.myVmware = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.myVmwareConfiguration
    ];
  };
}
