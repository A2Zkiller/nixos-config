{...}: {
  flake.nixosModules.zram = {
    zramSwap.enable = true;
    systemd.oomd.enable = true;
  };
}
