{
  delib,
  inputs,
  ...
}:
delib.module {
  name = "server.nix-minecraft";

  options = delib.singleEnableOption false;

  nixos.always.imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
}
