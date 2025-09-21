{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "features.lix";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.nix.package = pkgs.lixPackageSets.stable.lix;
}
