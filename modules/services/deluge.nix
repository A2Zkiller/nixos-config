{inputs, ...}: {
  flake.nixosModules.deluge = {
    services.deluge = {
      enable = true;
      web.enable = true;
    };
  };
}
