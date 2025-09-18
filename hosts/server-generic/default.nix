{delib, ...}:
delib.host {
  name = "server-generic";

  rice = "catppuccin-mocha";
  type = "server";

  # nix run nixpkgs#nixos-anywhere --flake .#server-generic --generate-hardware-config nixos-generate-config ./hosts/server/hardware-configuration.nix <hostname>
}
