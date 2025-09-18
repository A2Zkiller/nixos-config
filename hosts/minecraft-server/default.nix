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
}
