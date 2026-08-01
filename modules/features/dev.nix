{self, ...}: {
  flake.nixosModules.dev = {
    imports = [
      self.nixosModules.nix-ld
      self.nixosModules.gdb
      self.nixosModules.docs
    ];
  };
}
