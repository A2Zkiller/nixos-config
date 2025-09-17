{
  delib,
  host,
  ...
}:
delib.module {
  name = "librewolf";

  options = delib.singleEnableOption host.isPC;

  home.ifEnabled.programs.librewolf = {
    enable = true;
  };
}
