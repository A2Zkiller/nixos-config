{
  flake.nixosModules.base = {lib, ...}: {
    options.preferences.monitors = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "Output/connector name, e.g. DP-1, HDMI-A-1.";
          };
          resolution = lib.mkOption {
            type = lib.types.str;
            description = "Resolution in <width>x<height> format.";
          };
          refreshRate = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "Optional exact refresh rate string, e.g. 165.000.";
          };
        };
      });
      default = [];
      description = "Monitor configs translated into niri's settings.outputs.";
    };
  };
}
