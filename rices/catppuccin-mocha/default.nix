{
  delib,
  pkgs,
  ...
}:
delib.rice {
  name = "catppuccin-mocha";

  myconfig.constants = {
    wallpaper = ./wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
