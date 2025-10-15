{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "jujutsu";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.jujutsu = {
    enable = true;
    package = pkgs.jujutsu;
  };
}
