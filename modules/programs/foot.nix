{delib, ...}:
delib.module {
  name = "programs.foot";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.foot = {
    enable = true;
  };
}
