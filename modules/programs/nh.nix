{delib, ...}: let
  flake = "/home/a2z/nixos-config-denix";
in
  delib.module
  {
    name = "programs.nh";

    options = delib.singleEnableOption true;

    nixos.ifEnabled.programs.nh = {
      enable = true;
      clean.enable = true;
      inherit flake;
    };

    nixos.ifEnabled.environment.sessionVariables = {
      NH_FLAKE = flake;
    };
  }
