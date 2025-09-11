{ delib, ... }:
delib.rice {
  name = "catppuccin-mocha";

  inherits = [ "stylix" ];

  options.rices = with delib; {
    wallpaper = pathOption ./wallpaper.png;
    polarity = strOption "dark";
  };
}
