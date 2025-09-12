{delib, ...}:
delib.module {
  name = "rices";

  options.rices = with delib; {
    wallpaper = pathOption ./.;
    polarity = strOption "dark";
    base16Scheme = strOption "";
  };
}
