{self, inputs, ...}: {
  flake.nixosModules.nh = {...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;
    };
  };
}
