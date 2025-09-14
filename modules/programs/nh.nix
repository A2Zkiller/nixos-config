{delib, ...}:
delib.module {
  name = "programs.nh";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.programs.nh = {
    enable = true;
    clean.enable = true;
    flake = builtins.toString ../../..;
  };
}
