{delib, ...}:
delib.host {
  name = "minecraft-server";

  rice = "catppuccin-mocha";
  type = "server";

  myconfig.server = {
    nix-minecraft = {
      enable = true;

      main.enable = true;
    };
  };

  # nix run nixpkgs#nixos-anywhere --flake .#minecraft-server --generate-hardware-config nixos-generate-config ./hosts/minecraft-server/hardware-configuration.nix root@216.45.53.180
}
