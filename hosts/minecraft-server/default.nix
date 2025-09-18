{delib, ...}:
delib.host {
  name = "minecraft-server";

  rice = "catppuccin-mocha";
  type = "server";

  myconfig = {
    features.grub.device = "/dev/vda";

    server = {
      nix-minecraft = {
        enable = true;
        main.enable = true;
      };
    };
  };
}
