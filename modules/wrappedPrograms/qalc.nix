{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.myQalc = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.libqalculate;
      exePath = "/bin/qalc";
      addFlag = [
        ["-s" "autocalc on"]
        ["-s" "decimal comma off"]
      ];
    };
  };
}
