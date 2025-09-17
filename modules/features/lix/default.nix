{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "features.lix";

  options = delib.singleEnableOption false;

  nixos.ifEnabled.nix.package = pkgs.lixPackageSets.latest.lix;
}
