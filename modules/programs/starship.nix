{ delib, ... }:
delib.module {
  name = "programs.starship";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.starship = {
    enable = true;
  };
}
