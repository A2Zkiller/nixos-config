{
  delib,
  inputs,
  ...
}:
delib.overlayModule {
  name = "server.nix-minecraft";

  overlay = inputs.nix-minecraft.overlay;
}
